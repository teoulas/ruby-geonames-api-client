require_relative '../../../test_helper'

class ErrorTest < Minitest::Test
  def test_error_10
    assert_kind_of Geonames::API::Error::AuthorizationException,
      Geonames::API::Error.from_code(10, 'msg')
  end

  def test_error_11
    assert_kind_of Geonames::API::Error::RecordDoesNotExist,
      Geonames::API::Error.from_code(11, 'msg')
  end

  def test_error_12
    assert_kind_of Geonames::API::Error::OtherError,
      Geonames::API::Error.from_code(12, 'msg')
  end

  def test_error_13
    assert_kind_of Geonames::API::Error::DatabaseTimeout,
      Geonames::API::Error.from_code(13, 'msg')
  end

  def test_error_14
    assert_kind_of Geonames::API::Error::InvalidParameter,
      Geonames::API::Error.from_code(14, 'msg')
  end

  def test_error_15
    assert_kind_of Geonames::API::Error::NoResultFound,
      Geonames::API::Error.from_code(15, 'msg')
  end

  def test_error_16
    assert_kind_of Geonames::API::Error::DuplicateException,
      Geonames::API::Error.from_code(16, 'msg')
  end

  def test_error_17
    assert_kind_of Geonames::API::Error::PostalCodeNotFound,
      Geonames::API::Error.from_code(17, 'msg')
  end

  def test_error_18
    assert_kind_of Geonames::API::Error::DailyLimitExceeded,
      Geonames::API::Error.from_code(18, 'msg')
  end

  def test_error_19
    assert_kind_of Geonames::API::Error::HourlyLimitExceeded,
      Geonames::API::Error.from_code(19, 'msg')
  end

  def test_error_20
    assert_kind_of Geonames::API::Error::WeeklyLimitExceeded,
      Geonames::API::Error.from_code(20, 'msg')
  end

  def test_error_21
    assert_kind_of Geonames::API::Error::InvalidInput,
      Geonames::API::Error.from_code(21, 'msg')
  end

  def test_error_22
    assert_kind_of Geonames::API::Error::ServerOverloadedException,
      Geonames::API::Error.from_code(22, 'msg')
  end

  def test_error_23
    assert_kind_of Geonames::API::Error::ServiceNotImplemented,
      Geonames::API::Error.from_code(23, 'msg')
  end

  def test_unknown_error
    assert_kind_of Geonames::API::Error::Unknown,
      Geonames::API::Error.from_code(123, 'msg')
  end
end
