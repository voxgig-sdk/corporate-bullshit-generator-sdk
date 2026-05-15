package = "voxgig-sdk-corporate-bullshit-generator"
version = "0.0-1"
source = {
  url = "git://github.com/voxgig-sdk/corporate-bullshit-generator-sdk.git"
}
description = {
  summary = "CorporateBullshitGenerator SDK for Lua",
  license = "MIT"
}
dependencies = {
  "lua >= 5.3",
  "dkjson >= 2.5",
  "dkjson >= 2.5",
}
build = {
  type = "builtin",
  modules = {
    ["corporate-bullshit-generator_sdk"] = "corporate-bullshit-generator_sdk.lua",
    ["config"] = "config.lua",
    ["features"] = "features.lua",
  }
}
