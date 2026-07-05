# frozen_string_literal: true

# Typed models for the CorporateBullshitGenerator SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# GenerateCorporateBullshit entity data model.
#
# @!attribute [rw] phrase
#   @return [String, nil]
GenerateCorporateBullshit = Struct.new(
  :phrase,
  keyword_init: true
)

# Request payload for GenerateCorporateBullshit#load.
#
# @!attribute [rw] phrase
#   @return [String, nil]
GenerateCorporateBullshitLoadMatch = Struct.new(
  :phrase,
  keyword_init: true
)

