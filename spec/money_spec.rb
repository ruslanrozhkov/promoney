require 'spec_helper'

RSpec.configure do |config|
	config.before(:all) do
		Promoney.configure do |config|
			config.base_currency = 'EUR'
			config.currencies_rates = {'USD' => 1.25, 'Bitcoin' => 0.0004}
		end
	end	
end

describe Money do

	let(:five_dollars){ Money.new(5, 'USD') }
	let(:five_eur){ Money.new(5, 'EUR') }
	
	it "check bace currency rate" do
    	expect(five_dollars.base_currency).to eq('EUR')
    end
    
    it "check currencies rates" do
	    expect(five_dollars.currencies_rates['USD']).to eq(1.25)
    	expect(five_dollars.currencies_rates['Bitcoin']).to eq(0.0004)
	 end
  	
  	it "get money instance amount" do
  		expect(five_dollars.amount).to eq(5)
	end

	it "get money instance currency" do
    	expect(five_dollars.currency).to eq('USD')
	end

  	it "convert to a different currency" do
  		expect(five_eur.convert_to('USD').amount).to eq(6.25)
  	end

	it "addition two different currency" do
  		expect(five_eur + five_dollars).to eq(Money.new(9, 'EUR'))
  	end 

	it "subtract from a different currency" do
  		expect(five_eur - five_dollars).to eq(Money.new(1, 'EUR'))
  	end

  	it "divider for currency" do
  		expect(five_eur / 2).to eq(Money.new(2.5, 'EUR'))
	end

  	it "multiplier for currency" do
  		expect(five_dollars * 2).to eq(Money.new(10, 'USD'))
  	end

  	it "comparison of two different currencies" do
  		four_eur = Money.new(4, 'EUR')
  		expect(four_eur == five_dollars).to eq(true)
  		expect(five_eur > five_dollars).to eq(true)
  		expect(five_dollars < five_eur).to eq(true)
  	end
end