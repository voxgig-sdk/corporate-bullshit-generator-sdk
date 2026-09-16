# CorporateBullshitGenerator SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/ratelimit_feature'
require_relative 'feature/retry_feature'
require_relative 'feature/test_feature'
require_relative 'feature/timeout_feature'


module CorporateBullshitGeneratorFeatures
  def self.make_feature(name)
    case name
    when "base"
      CorporateBullshitGeneratorBaseFeature.new
    when "ratelimit"
      CorporateBullshitGeneratorRatelimitFeature.new
    when "retry"
      CorporateBullshitGeneratorRetryFeature.new
    when "test"
      CorporateBullshitGeneratorTestFeature.new
    when "timeout"
      CorporateBullshitGeneratorTimeoutFeature.new
    else
      CorporateBullshitGeneratorBaseFeature.new
    end
  end
end
