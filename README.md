# geonames-api-client

This gem is a simple wrapper for the geonames.org JSON API. It will raise an
exception, if the API responds with an error, or if the HTTP GET request fails.
If the request is successful, it will parse the JSON response and return it as
a [Hashie::Mash](https://github.com/intridea/hashie#mash) object.

Currently the gem supports the following methods:

- [get](http://www.geonames.org/export/web-services.html#get)
- [search](http://www.geonames.org/export/geonames-search.html)
- [timezone](http://www.geonames.org/export/web-services.html#timezone)

Feel free to add any missing methods and send a pull request!

## Installation

Add this line to your application's Gemfile:

    gem 'geonames-api-client'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install geonames-api-client

## Usage

### Short version

Configure:
```
Geonames.configuration = {
  :username => 'your-username',
  :host => 'api.geonames.org'
}
```
Make requests:
```
Geonames.get(123)
Geonames.search({:q => 'london'})
```

### Long version

```
config = {:username => 'demo'}
client = Geonames::Client.new(config)
client.get(123)
```

The methods are defined on Geonames::Client, but the Geonames module uses
`method_missing` magic to instantiate a client and call the relevant method
with the parameters passed.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
