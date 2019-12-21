# Lexically

Using the refinements mechanism, This gem allows you to mark methods with the visibility like `private`, but it's more like Java's or PHP's `private`. i.e. `lexically` defined class cannot be called from derived class.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lexically'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lexically

## Usage

Include the `Lexically` module into your class, and define methods under lexically block with `using`.

```ruby
class C
  include Lexically

  using lexically {
    def lexical_method
      :foo
    end
  }

  def public_api
    lexical_method
  end
end

class D < C
  def derived
    lexical_method
  end
end

C.new.public_api     #=> :foo
C.new.lexical_method #=> raises NameError
D.new.lexical_method #=> raises NameError because the D is derived class
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nonowarn/lexically.
