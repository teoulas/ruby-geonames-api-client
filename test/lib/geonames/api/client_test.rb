require_relative '../../../test_helper'

class ClientTest < Minitest::Test
  def teardown
    FakeWeb.allow_net_connect = true
    FakeWeb.clean_registry
  end

  def test_config_reader_when_config_empty
    Geonames::API::Client.config = nil
    assert_equal({}, Geonames::API::Client.config)
  end

  def test_config_writer
    Geonames::API::Client.config = {'host' => 'example.org'}
    assert_equal({'host' => 'example.org'}, Geonames::API::Client.config)
  end

  def test_default_params
    Geonames::API::Client.config = {'host' => 'example.org', 'username' => 'demo', 'a' => 1}
    assert_equal({'username' => 'demo'}, Geonames::API::Client.default_params)
  end

  def test_api_request_404
    Geonames::API::Client.config = {'host' => 'example.org'}
    assert_raises(OpenURI::HTTPError) {
      Geonames::API::Client.api_request('/invalid', {})
    }
  end

  def test_api_request_api_error
    FakeWeb.allow_net_connect = false
    FakeWeb.register_uri(:get, 'http://example.org/error?username=demo', {:body => "{\"status\":{\"message\":\"api error\",\"value\":23}}"})
    Geonames::API::Client.config = {'host' => 'example.org', 'username' => 'demo'}
    assert_raises(Geonames::API::Error::ServiceNotImplemented) {
      Geonames::API::Client.api_request('/error', {})
    }
  end

  def test_get_with_id_only
    FakeWeb.allow_net_connect = false
    FakeWeb.register_uri(:get, 'http://example.org/getJSON?username=demo&geonameId=123', {:body => '{"geonames":[]}'})
    Geonames::API::Client.config = {'host' => 'example.org', 'username' => 'demo'}
    assert_equal({'geonames' => []}, Geonames::API::Client.get(123))
  end
end

