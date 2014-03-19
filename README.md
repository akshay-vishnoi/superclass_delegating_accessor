# SuperclassDelegatingAccessor

A Ruby utility that defines both class and instance accessors for class attributes. Creates private *_attr* and *_attr=* methods that can still be used if the public methods are overridden.


## Installation

Add this line to your application's Gemfile:

```shell
gem 'superclass_delegating_accessor', '~> 0.0.1'
```

And then execute:

```shell
$ bundle
```

Or install it yourself as:

```shell
$ gem install superclass_delegating_accessor
```

## Usage

```ruby
class Person
  superclass_delegating_accessor :hair_colors
end

Person.hair_colors = [:brown, :black, :blonde, :red]
Person.hair_colors     # => [:brown, :black, :blonde, :red]
Person.new.hair_colors # => [:brown, :black, :blonde, :red]
```

If a subclass changes the value then that would also change the value for parent class. Similarly if parent class changes the value then that would change the value of subclasses too.

```ruby
class Male < Person
end

Male.hair_colors << :blue
Person.hair_colors # => [:brown, :black, :blonde, :red, :blue]
```

To opt out of the instance reader method, pass `instance_reader: false`.

```ruby
class Person
  cattr_accessor :hair_colors, instance_writer: false, instance_reader: false
end

Person.new.hair_colors = [:brown]  # => NoMethodError
Person.new.hair_colors             # => NoMethodError
```

Or pass `instance_accessor: false`, to opt out both instance methods.

```ruby
class Person
  cattr_accessor :hair_colors, instance_accessor: false
end

Person.new.hair_colors = [:brown]  # => NoMethodError
Person.new.hair_colors             # => NoMethodError
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
