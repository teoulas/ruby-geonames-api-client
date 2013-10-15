require 'open-uri'
require 'json'

module Geonames
  module API
    module Client
      def self.config
        @config || {}
      end

      def self.config=(config)
        @config = config
      end

      def self.get(geoname_id, options = {})
        api_request('/getJSON', {geonameId: geoname_id})
      end

      def self.default_params
        {'username' => config['username']}
      end

      def self.api_request(endpoint, params)
        params = params.merge(default_params)
        uri = URI("http://#{config['host']}#{endpoint}")
        uri.query = URI.encode_www_form(params)

        body = JSON.parse(open(uri).read)

        if body['status']
          raise Error.from_code(body['status']['value'], body['status']['message'])
        else
          body
        end
      end
    end
  end
end
