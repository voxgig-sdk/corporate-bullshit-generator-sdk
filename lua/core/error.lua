-- CorporateBullshitGenerator SDK error

local CorporateBullshitGeneratorError = {}
CorporateBullshitGeneratorError.__index = CorporateBullshitGeneratorError


function CorporateBullshitGeneratorError.new(code, msg, ctx)
  local self = setmetatable({}, CorporateBullshitGeneratorError)
  self.is_sdk_error = true
  self.sdk = "CorporateBullshitGenerator"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function CorporateBullshitGeneratorError:error()
  return self.msg
end


function CorporateBullshitGeneratorError:__tostring()
  return self.msg
end


return CorporateBullshitGeneratorError
