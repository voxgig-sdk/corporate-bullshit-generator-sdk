# CorporateBullshitGenerator SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module CorporateBullshitGeneratorFeatures
  def self.make_feature(name)
    case name
    when "base"
      CorporateBullshitGeneratorBaseFeature.new
    when "test"
      CorporateBullshitGeneratorTestFeature.new
    else
      CorporateBullshitGeneratorBaseFeature.new
    end
  end
end
