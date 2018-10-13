# AmazonPa

`AmazonPa` gem is easy using Amazon Product Advertising API(https://affiliate.amazon.co.jp/assoc_credentials/home) for Ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'amazon_pa'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install amazon_pa

Add configure:

```ruby
AmazonPa::Config.configure do |config|
  config.locale = :jp
  config.service_url = AmazonPa::Config.service_url
  config.access_key = '<!-- Add access key -->'
  config.secret_key = '<!-- Add secret key -->'
  config.associate_tag = '<!-- Add associate tag -->'
end
```

## Usage

### Simple case

Search item attributes by ASIN
```ruby
  instance = AmazonPa::Api.request(:item_lookup)
  response = instance::request('4274065979')
  p response.body.get_element('Items/Item').get('ASIN') # 4274065979
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/amazon_pa. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the AmazonPa project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/amazon_pa/blob/master/CODE_OF_CONDUCT.md).

