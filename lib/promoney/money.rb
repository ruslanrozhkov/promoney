class Money
	attr_reader :base_currency, :currencies_rates
	attr_accessor :amount, :currency

	def initialize(amount, currency)
		@amount = amount
		@currency = currency
		conversion_rates(Promoney.configuration.base_currency, Promoney.configuration.currencies_rates)
	end

	# setup base and other currencies rates
	def conversion_rates(base_currency, currencies_rates)
		@currencies_rates = { 
			'EUR' 		=> currencies_rates['EUR'],
			'USD' 		=> currencies_rates['USD'],
			'Bitcoin' 	=> currencies_rates['Bitcoin']
		}
		
		case base_currency
		when 'EUR' then @currencies_rates['EUR'] = 1
		when 'USD' then @currencies_rates['USD'] = 1
		when 'Bitcoin' then @currencies_rates['Bitcoin'] = 1
		end

		@base_currency = base_currency
	end

	# convert money instance in different currency
	def convert_to(currency)
		if currency == @base_currency
			balance = self.amount / @currencies_rates[self.currency]
		else
			balance = self.amount * @currencies_rates[currency]
		end
		Money.new(balance, currency)
	end

	# Arithmetics methods
	def +(money)
		sum = self.amount + money.convert_to(self.currency).amount
		Money.new(sum, self.currency)
	end

	def -(money)
		remain = self.amount - money.convert_to(self.currency).amount
		Money.new(remain, self.currency)
	end

	def /(divider)
		remain = self.amount.to_f / divider
		Money.new(remain, self.currency)
	end

	def *(multiplier)
		sum = self.amount * multiplier
		Money.new(sum, self.currency)
	end

	# Comparisons methods
	def ==(money)
		self.convert_to('EUR').amount == money.convert_to('EUR').amount
	end

	def >(money)
		self.convert_to('EUR').amount > money.convert_to('EUR').amount
	end

	def <(money)
		self.convert_to('EUR').amount < money.convert_to('EUR').amount
	end
end
