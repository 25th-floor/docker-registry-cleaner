# Docker::Registry::Cleaner

[![Build Status](https://travis-ci.org/25th-floor/docker-registry-cleaner.svg?branch=master)](https://travis-ci.org/25th-floor/docker-registry-cleaner)

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/docker/registry/cleaner`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Clone this repository and execute bundler:

```
git clone git@github.com:25th-floor/docker-registry-cleaner.git
cd docker-registry-cleaner
bundle
```

## Usage

```
export REGISTRY_BASE_PATH='https://dockerhub.example.com'
./exe/docker-registry-cleaner
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/25th-floor/docker-registry-cleaner.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
