# CorporateBullshitGenerator SDK context

require_relative '../utility/struct/voxgig_struct'
require_relative 'control'
require_relative 'operation'
require_relative 'spec'
require_relative 'result'
require_relative 'response'
require_relative 'error'
require_relative 'helpers'

class CorporateBullshitGeneratorContext
  attr_accessor :id, :out, :client, :utility, :ctrl, :meta, :config,
                :entopts, :options, :entity, :shared, :opmap,
                :data, :reqdata, :match, :reqmatch, :point,
                :spec, :result, :response, :op

  def initialize(ctxmap = {}, basectx = nil)
    ctxmap ||= {}
    @id = "C#{rand(10000000..99999999)}"
    @out = {}

    @client = CorporateBullshitGeneratorHelpers.get_ctx_prop(ctxmap, "client") || basectx&.client
    @utility = CorporateBullshitGeneratorHelpers.get_ctx_prop(ctxmap, "utility") || basectx&.utility

    @ctrl = CorporateBullshitGeneratorControl.new
    ctrl_raw = CorporateBullshitGeneratorHelpers.get_ctx_prop(ctxmap, "ctrl")
    if ctrl_raw.is_a?(Hash)
      @ctrl.throw_err = ctrl_raw["throw"] if ctrl_raw.key?("throw")
      @ctrl.explain = ctrl_raw["explain"] if ctrl_raw["explain"].is_a?(Hash)
    elsif basectx&.ctrl
      @ctrl = basectx.ctrl
    end

    m = CorporateBullshitGeneratorHelpers.get_ctx_prop(ctxmap, "meta")
    @meta = m.is_a?(Hash) ? m : (basectx&.meta || {})

    cfg = CorporateBullshitGeneratorHelpers.get_ctx_prop(ctxmap, "config")
    @config = cfg.is_a?(Hash) ? cfg : basectx&.config

    eo = CorporateBullshitGeneratorHelpers.get_ctx_prop(ctxmap, "entopts")
    @entopts = eo.is_a?(Hash) ? eo : basectx&.entopts

    o = CorporateBullshitGeneratorHelpers.get_ctx_prop(ctxmap, "options")
    @options = o.is_a?(Hash) ? o : basectx&.options

    e = CorporateBullshitGeneratorHelpers.get_ctx_prop(ctxmap, "entity")
    @entity = e || basectx&.entity

    s = CorporateBullshitGeneratorHelpers.get_ctx_prop(ctxmap, "shared")
    @shared = s.is_a?(Hash) ? s : basectx&.shared

    om = CorporateBullshitGeneratorHelpers.get_ctx_prop(ctxmap, "opmap")
    @opmap = om.is_a?(Hash) ? om : (basectx&.opmap || {})

    @data = CorporateBullshitGeneratorHelpers.to_map(CorporateBullshitGeneratorHelpers.get_ctx_prop(ctxmap, "data")) || {}
    @reqdata = CorporateBullshitGeneratorHelpers.to_map(CorporateBullshitGeneratorHelpers.get_ctx_prop(ctxmap, "reqdata")) || {}
    @match = CorporateBullshitGeneratorHelpers.to_map(CorporateBullshitGeneratorHelpers.get_ctx_prop(ctxmap, "match")) || {}
    @reqmatch = CorporateBullshitGeneratorHelpers.to_map(CorporateBullshitGeneratorHelpers.get_ctx_prop(ctxmap, "reqmatch")) || {}

    pt = CorporateBullshitGeneratorHelpers.get_ctx_prop(ctxmap, "point")
    @point = pt.is_a?(Hash) ? pt : basectx&.point

    sp = CorporateBullshitGeneratorHelpers.get_ctx_prop(ctxmap, "spec")
    @spec = sp.is_a?(CorporateBullshitGeneratorSpec) ? sp : basectx&.spec

    r = CorporateBullshitGeneratorHelpers.get_ctx_prop(ctxmap, "result")
    @result = r.is_a?(CorporateBullshitGeneratorResult) ? r : basectx&.result

    rp = CorporateBullshitGeneratorHelpers.get_ctx_prop(ctxmap, "response")
    @response = rp.is_a?(CorporateBullshitGeneratorResponse) ? rp : basectx&.response

    opname = CorporateBullshitGeneratorHelpers.get_ctx_prop(ctxmap, "opname") || ""
    @op = resolve_op(opname)
  end

  def resolve_op(opname)
    return @opmap[opname] if @opmap[opname]
    return CorporateBullshitGeneratorOperation.new({}) if opname.empty?

    entname = @entity&.respond_to?(:get_name) ? @entity.get_name : "_"
    opcfg = VoxgigStruct.getpath(@config, "entity.#{entname}.op.#{opname}")

    input = (opname == "update" || opname == "create") ? "data" : "match"

    points = []
    if opcfg.is_a?(Hash)
      t = VoxgigStruct.getprop(opcfg, "points")
      points = t if t.is_a?(Array)
    end

    op = CorporateBullshitGeneratorOperation.new({
      "entity" => entname,
      "name" => opname,
      "input" => input,
      "points" => points,
    })
    @opmap[opname] = op
    op
  end

  def make_error(code, msg)
    CorporateBullshitGeneratorError.new(code, msg, self)
  end
end
