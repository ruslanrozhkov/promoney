# Promoney

Ruby gem to perform currency conversion and arithmetics with different currencies.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'promoney'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install promoney

## Usage
```ruby
require 'promoney'
```
First configure the currency rates:
```ruby
ProMoney.configure do |config|
	config.base_currency = 'EUR' # base currency
	config.currencies_rates = {'USD' => 1.11, 'Bitcoin' => 0.0047} # other currencies
end
```
Instantiate money objects:
```ruby
fifty_eur = Money.new(50, 'EUR')
```
Get amount and currency:
```ruby
fifty_eur.amount   # => 50
fifty_eur.currency # => "EUR"
```
Convert to a different currency:
```ruby
fifty_eur.convert_to('USD') # => 55.50 USD
```
Perform operations in different currencies:
```ruby
twenty_dollars = Money.new(20, 'USD')
```
Arithmetics:
```ruby
fifty_eur + twenty_dollars # => 68.02 EUR
fifty_eur - twenty_dollars # => 31.98 EUR
fifty_eur / 2              # => 25 EUR
twenty_dollars * 3         # => 60 USD
```
Comparisons (also in different currencies):
```ruby
twenty_dollars == Money.new(20, 'USD') # => true
twenty_dollars == Money.new(30, 'USD') # => false

fifty_eur_in_usd = fifty_eur.convert_to('USD')
fifty_eur_in_usd == fifty_eur          # => true

twenty_dollars > Money.new(5, 'USD')   # => true
twenty_dollars < fifty_eur             # => true
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/promoney. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

