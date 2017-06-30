require 'promoney/version'
require 'promoney/configuration'
require 'promoney/money'


module Promoney
  class << self
  	attr_accessor :configuration
  end

  def self.configuration
  	@configuration ||= Configuration.new
  end

  def self.reset
  	@configuration = Configuration.new
  end

  def self.configure
  	yield(configuration)
  end
end