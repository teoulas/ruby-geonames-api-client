require 'hashie'

module Geonames
  class Configuration < Hashie::Dash
    property :host, :default => 'api.geonames.org'
    property :username, :default => 'demo'
    property :strict_mode, :default => true
  end
end
