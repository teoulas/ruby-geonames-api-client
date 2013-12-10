require 'open-uri'
require 'json'
require 'hashie'

module Geonames
  class Client
    VALID_METHODS = %w(get search timezone hierarchy).freeze

    def initialize(config)
      @config = Geonames::Configuration.new(config)
    end

    def get(geoname_id, options = {})
      options = Params::Base.new(options)
      api_request('/getJSON', {geonameId: geoname_id}.merge(options))
    end

    def search(options)
      options = Params::Search.new(options)
      api_request('/searchJSON', options)
    end

    def timezone(lat, lng, options = {})
      options = Params::Timezone.new(options)
      api_request('/timezoneJSON', {lat: lat, lng: lng}.merge(options))
    end

    def hierarchy(geoname_id, options = {})
      options = Params::Base.new(options)
      api_request('/hierarchyJSON', {geonameId: geoname_id}.merge(options))
    end

    def api_request(endpoint, params = {})
      uri = URI("http://#{@config.host}#{endpoint}")
      uri.query = query_string(params)

      body = Hashie::Mash.new(JSON.parse(open(uri).read)).freeze

      if body['status'] && @config.strict_mode
        raise Error.from_code(body['status']['value'], body['status']['message'])
      else
        body
      end
    end

    def query_string(params)
      URI.encode_www_form({username: @config.username}.merge(params))
    end
  end
end
