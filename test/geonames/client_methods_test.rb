require_relative '../test_helper'

class ClientMethodsTest < Minitest::Test
  def setup
    @client = Geonames::Client.new({host: 'example.org', username: 'demo'})
    FakeWeb.allow_net_connect = false
  end

  def teardown
    FakeWeb.allow_net_connect = true
    FakeWeb.clean_registry
  end

  def test_get_with_id_only
    FakeWeb.register_uri(:get, 'http://example.org/getJSON?username=demo&geonameId=123', {:body => '{"geonames":[]}'})
    assert_equal({'geonames' => []}, @client.get(123))
  end

  def test_get_with_id_and_option
    FakeWeb.register_uri(:get, 'http://example.org/getJSON?username=demo&geonameId=123&style=full', {:body => '{"geonames":[]}'})
    assert_equal({'geonames' => []}, @client.get(123, {:style => 'full'}))
  end

  def test_search_q
    FakeWeb.register_uri(:get, 'http://example.org/searchJSON?username=demo&q=london', {:body => '{"geonames":[]}'})
    assert_equal({'geonames' => []}, @client.search({:q => 'london'}))
  end

  def test_timezone_with_lat_lng
    FakeWeb.register_uri(:get, 'http://example.org/timezoneJSON?username=demo&lat=45.5&lng=20.5', {:body => '{"geonames":[]}'})
    assert_equal({'geonames' => []}, @client.timezone(45.5, 20.5))
  end

  def test_hierarchy_with_id
    FakeWeb.register_uri(:get, 'http://example.org/hierarchyJSON?username=demo&geonameId=123', {:body => '{"geonames":[]}'})
    assert_equal({'geonames' => []}, @client.hierarchy(123))
  end
end
