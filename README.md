# GameSetMatch

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'game_set_match'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install game_set_match

## Usage
Let's say you have two lists of songs: filenames and user inputs. You want to match user inputs to filenames that you have. 

```
filenames = ['01 - Lana Del Rey.mp4', '04 - The Heebee Jeeby Experience', '05 - Woodstock: What I learned']
user_inputs = ['the_ heebee jeeby experience', 'lana del ray', 'woodstok what I learned']
GameSetMatch.new(filenames, user_inputs) => 
    	{"the_ heebee jeeby experience"=>"04 - The Heebee Jeeby Experience", 
    	"lana del ray"=>"01 - Lana Del Rey.mp4", 
    	"woodstok what I learned"=>"05 - Woodstock: What I learned"}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pgragg/game_set_match.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

