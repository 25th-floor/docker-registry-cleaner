require 'spec_helper'

require 'docker/registry/cleaner/config'

describe Docker::Registry::Cleaner::Config do
  it 'requires a base path' do
    expect { Docker::Registry::Cleaner::Config.new }.to raise_error /REGISTRY_BASE_PATH.*missing/
  end

  it 'has a default for strategy_build_number_count' do
    ENV['REGISTRY_BASE_PATH'] = 'http://dockerhub.example.org'
    config = Docker::Registry::Cleaner::Config.new
    expect(config.strategy_build_number_count).to be 5
  end
end
