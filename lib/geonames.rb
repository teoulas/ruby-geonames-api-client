require 'geonames/version'
require 'geonames/configuration'
require 'geonames/params'
require 'geonames/error'
require 'geonames/client'

module Geonames
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configuration=(configuration)
    @configuration = Geonames::Configuration.new(configuration)
  end

  def self.method_missing(method, *args)
    if respond_to?(method)
      Client.new(configuration).send(method, *args)
    else
      super
    end
  end

  def self.respond_to_missing?(method, include_private = false)
    if Client::VALID_METHODS.include?(method.to_s)
      true
    else
      super
    end
  end
end
