require 'spec_helper'

describe Docker::Registry::Cleaner do
  it 'has a version number' do
    expect(Docker::Registry::Cleaner::VERSION).not_to be nil
  end
end
