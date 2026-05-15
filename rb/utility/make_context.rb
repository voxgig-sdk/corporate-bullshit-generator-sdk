# CorporateBullshitGenerator SDK utility: make_context
require_relative '../core/context'
module CorporateBullshitGeneratorUtilities
  MakeContext = ->(ctxmap, basectx) {
    CorporateBullshitGeneratorContext.new(ctxmap, basectx)
  }
end
