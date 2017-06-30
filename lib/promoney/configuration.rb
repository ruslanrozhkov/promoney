module Promoney
	class Configuration
		attr_accessor :currencies_rates, :base_currency
		
		def initialize
			@base_currency = 'EUR' 
			@currencies_rates = {'USD' => 1.25, 'Bitcoin' => 0.0047}
		end
	end
end