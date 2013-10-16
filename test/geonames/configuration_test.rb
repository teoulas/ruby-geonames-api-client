require_relative '../test_helper'

class ConfigurationTest < Minitest::Test
  def setup
    @config = Geonames::Configuration.new
  end

  def test_config_default_host
    assert_equal Geonames::Configuration.defaults[:host], @config.host
  end

  def test_config_default_username
    assert_equal Geonames::Configuration.defaults[:username], @config.username
  end

  def test_config_default_strict_mode
    assert_equal Geonames::Configuration.defaults[:strict_mode], @config.strict_mode
  end

  def test_config_other_host
    @config.host = 'test.example.org'
    assert_equal 'test.example.org', @config.host
  end

  def test_config_other_username
    @config.username = 'testuser'
    assert_equal 'testuser', @config.username
  end

  def test_config_other_strict_mode
    @config.strict_mode = false
    assert_equal false, @config.strict_mode
  end
end
