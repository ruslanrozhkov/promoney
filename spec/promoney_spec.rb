require "spec_helper"

describe Promoney do
	it "first configure the currency rates" do
		RSpec.configure do |config|
			config.before(:all) do
				Promoney.configure do |config|
					config.base_currency = 'EUR'
					config.currencies_rates = {'USD' => 1.25, 'Bitcoin' => 0.0004}
				end
			end	
		end
	end
end
