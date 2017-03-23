[![Gem Version](https://badge.fury.io/rb/elixirize.svg)](http://badge.fury.io/rb/elixirize)
[![Code Climate](https://codeclimate.com/github/danielpclark/elixirize/badges/gpa.svg)](https://codeclimate.com/github/danielpclark/elixirize)
[![Build Status](https://travis-ci.org/danielpclark/elixirize.svg)](https://travis-ci.org/danielpclark/elixirize)
[![Test Coverage](https://codeclimate.com/github/danielpclark/elixirize/badges/coverage.svg)](https://codeclimate.com/github/danielpclark/elixirize)
[![Inline docs](http://inch-ci.org/github/danielpclark/elixirize.svg?branch=master)](http://inch-ci.org/github/danielpclark/elixirize)
[![SayThanks.io](https://img.shields.io/badge/SayThanks.io-%E2%98%BC-1EAEDB.svg)](https://saythanks.io/to/danielpclark)

# Elixirize

This adds the `ᐅ` method to Ruby.  It pipes in the returned value of the left as the first parameter of the
Proc on the right.

### Unicode ᐅ

To enter ᐅ you need to:

* **Linux:** type **CTRl-SHIFT-U** and then **1405** followed by the space or enter key.
* **Mac:**  hold the option key while you type **1405** and then release the option key.
* **VIM:** press **CTRL-v** then **SHIFT-U** then **1405** and hit enter.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'elixirize'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install elixirize

## Usage

```ruby
def add a, b
  a + b
end

subtract = ->a, b{ a - b }

add(4, 5).ᐅ subtract, 15
# => -6

def divide a, b
  a / b
end

add(40, 60).ᐅ method(:divide), 20
# => 5
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/danielpclark/elixirize.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


