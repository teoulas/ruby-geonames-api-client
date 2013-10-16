require_relative '../test_helper'

class ClientUtilMethodsTest < Minitest::Test
  def setup
    @client = Geonames::Client.new({host: 'example.org', username: 'demo'})
  end

  def test_api_request_404
    assert_raises(OpenURI::HTTPError) {
      @client.api_request('/404')
    }
  end

  def test_api_request_api_error
    FakeWeb.allow_net_connect = false
    FakeWeb.register_uri(:get, 'http://example.org/error?username=demo', {:body => "{\"status\":{\"message\":\"api error\",\"value\":23}}"})
    assert_raises(Geonames::Error::ServiceNotImplemented) {
      @client.api_request('/error')
    }
    FakeWeb.allow_net_connect = true
    FakeWeb.clean_registry
  end

  def test_query_string_with_empty_options
    assert_equal("username=demo", @client.query_string({}))
  end

  def test_query_string_with_options
    assert_equal("username=demo&style=full", @client.query_string({:style => 'full'}))
  end
end

