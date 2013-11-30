# motion-distance

Easy distance tracking for RubyMotion projects.

## Installation

Add this line to your application's Gemfile:

    gem "motion-distance"

And then execute:

    $ bundle

## Usage

Create a new instance of `Motion::Distance`.

```ruby
@distance = Motion::Distance.new
```

Now you can call `#get` to begin tracking any distance travelled. Each time the phone registers a location change
you'll recieve a hash that contains the total distance travelled and current location.

Distance is always returned in meters.

```ruby
@distance.get do |location|
  puts location[:total]
end
```

You can stop tracking location by calling:

```ruby
@distance.stop_updating
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
