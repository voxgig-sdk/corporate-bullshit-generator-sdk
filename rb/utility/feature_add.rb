# CorporateBullshitGenerator SDK utility: feature_add
module CorporateBullshitGeneratorUtilities
  FeatureAdd = ->(ctx, f) {
    ctx.client.features << f
  }
end
