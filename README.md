# CapybaraClickAt - click_at(point) capybara helper

## Why do you need it?

1. If you want to click at certain point on a map
2. If you want to click at certain point on a canvas, colour select etc.


## Tested versions and drivers

- Capybara: v2.18, v3.0, v3.5
- Drivers: selenium, webkit, poltergeist

## Installation

Add this line to your application's Gemfile:

```ruby
group :test do
  gem 'capybara-click_at'
end
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capybara-click_at

### Rspec

In your spec_helper.rb

```
RSpec.configure do |config|
  config.include CapybaraClickAt
end
```

### Cucumber

In your env.rb

```
World CapybaraClickAt
```

## Usage

### Click at certain point on the page

```ruby
click_at(5, 5)
```

### Click at certain point inside a container specified by CSS or XPath selector

```ruby
click_at(5, 5, css: '#map')
click_at(5, 5, xpath: '//div[@id="select-colour"]')
```

## Contributing

1. Add a test case which covers the bug
2. Add code which makes the test green
3. Open pull request


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
