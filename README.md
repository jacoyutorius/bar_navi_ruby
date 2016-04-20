# BarNavi

BarNavi APIのRubyによるラッパー

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/bar_navi`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bar_navi'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bar_navi

## Usage


```
barnavi = BarNavi::Request.new("API_KEY", "YOUR_URL")
barnavi.get(
  preference: 22,
  address: "浜松"
  )
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/bar_navi.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


## API Reference for BarNavi

http://webapi.suntory.co.jp/barnavidocs/logo.html

## Powered By

![http://webapi.suntory.co.jp/barnavidocs](http://webapi.suntory.co.jp/barnavidocs/banner/barnavi_165_40_1.gif)

画像提供：BAR-NAVI by SUNTORY
