-- CorporateBullshitGenerator SDK exists test

local sdk = require("corporate-bullshit-generator_sdk")

describe("CorporateBullshitGeneratorSDK", function()
  it("should create test SDK", function()
    local testsdk = sdk.test(nil, nil)
    assert.is_not_nil(testsdk)
  end)
end)
