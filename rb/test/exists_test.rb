# CorporateBullshitGenerator SDK exists test

require "minitest/autorun"
require_relative "../CorporateBullshitGenerator_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = CorporateBullshitGeneratorSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
