require 'rest-client'
require 'json'
require 'docker/registry/cleaner/config'

module Docker::Registry::Cleaner
  class CLI
    attr_accessor :config

    def initialize(config = Config.new)
      @config = config
    end

    def run
      begin
        catalog_response = RestClient.get "#{@config.registry_base_path}/v2/_catalog"
        catalog_obj = JSON.parse(catalog_response.body)
      rescue => e
        puts "Registry error: #{e.message}"
        exit 1
      end

      catalog_obj['repositories'].each do |repo|
        # Fetch tags for repo
        begin
          tag_response = RestClient.get "#{@config.registry_base_path}/v2/#{repo}/tags/list"
          tags = JSON.parse(tag_response.body)['tags']
          next if tags.nil?
        rescue => e
          puts ">>> Repo #{repo} not found" if e.http_code == 404
          next
        end

        # Never clean latest
        tags = tags.select { |t| t != 'latest' }

        # Build number strategy: Just save the newest tags (default: 5)
        build_tags = tags
                         .select { |t| t.start_with? 'build-' }
                         .sort { |a, b| a.delete('build-').to_i <=> b.delete('build-').to_i }
        remove_tags = []
        if build_tags.length > @config.strategy_build_number_count
          remove_tags = build_tags.take (build_tags.length - @config.strategy_build_number_count)
        end

        # Resolve digests
        remove_digests = remove_tags.map do |tag|
          begin
            digest_response = RestClient.get "#{@config.registry_base_path}/v2/#{repo}/manifests/#{tag}",
                                             headers = {accept: 'application/vnd.docker.distribution.manifest.v2+json'}
            digest = digest_response.headers[:docker_content_digest]
          rescue => e
            puts ">>> #{repo}:#{tag} could not be resolved: #{e.message}"
            next
          end

          {:tag => tag, :digest => digest}
        end

        # Actually delete
        remove_digests.each do |elem|
          puts "Deleting #{repo}:#{elem[:tag]} (#{elem[:digest]})"
          begin
            RestClient.delete "#{@config.registry_base_path}/v2/#{repo}/manifests/#{elem[:digest]}"
          rescue => e
            puts ">>> Failed: #{e.message}"
          end
        end
      end
    end
  end
end
