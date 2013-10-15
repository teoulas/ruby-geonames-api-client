# Geonames::API::Client

This gem handles the requests to the geonames.org JSON API. It will raise an
exception, if the API responds with an error, or if the HTTP GET request fails.
If the request is successful, it will parse the JSON response and return it as
a plain old ruby object.

For convenience, it automatically passes the username as query string parameter
to all requests.

Currently the gem supports the following methods:

- [get](http://www.geonames.org/export/web-services.html#get)

Feel free to add any missing methods and send a pull request!

## Installation

Add this line to your application's Gemfile:

    gem 'geonames-api-client'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install geonames-api-client

## Usage

```
Geonames::API::Client.config = {
  'username' => 'your-username',
  'host' => 'api.geonames.org'
}


Geonames::API::Client.get(123456) # Returns the data for this geonameId
Geonames::API::Client.get(123456, {'style': 'short'}) # Same, but returns the short version
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
