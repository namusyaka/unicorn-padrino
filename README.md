# Unicorn::Padrino

Adds Unicorn as an adapter to your padrino start command.

## Installation

Add this line to your application's Gemfile:

    gem 'unicorn-padrino'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install unicorn-padrino

## Usage

### Basic usage

`padrino s` or `padrino s -a unicorn`

### Daemonize

If you want to daemonize the server, you should add `-d` option.

`padrino s -d`

### Configuration

`config/unicorn.rb` and `config/{development,production,test}/unicorn.rb` are automatically loaded.

Example)

```ruby
# config/unicorn.rb
listen "10146"
pid "unicorn.pid"
```

## Contributing

1. Fork it ( https://github.com/namusyaka/unicorn-padrino/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
