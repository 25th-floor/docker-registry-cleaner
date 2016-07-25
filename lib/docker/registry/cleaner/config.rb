module Docker
  module Registry
    module Cleaner
      class Config
        attr_accessor :registry_base_path
        attr_accessor :strategy_build_number_count

        def initialize
          @registry_base_path = ENV['REGISTRY_BASE_PATH']
          @strategy_build_number_count = 5

          raise 'REGISTRY_BASE_PATH is missing' if @registry_base_path.nil?
        end
      end
    end
  end
end
