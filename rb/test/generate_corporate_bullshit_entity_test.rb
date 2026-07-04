# GenerateCorporateBullshit entity test

require "minitest/autorun"
require "json"
require_relative "../CorporateBullshitGenerator_sdk"
require_relative "runner"

class GenerateCorporateBullshitEntityTest < Minitest::Test
  def test_create_instance
    testsdk = CorporateBullshitGeneratorSDK.test(nil, nil)
    ent = testsdk.GenerateCorporateBullshit(nil)
    assert !ent.nil?
  end

  def test_basic_flow
    setup = generate_corporate_bullshit_basic_setup(nil)
    # Per-op sdk-test-control.json skip.
    _live = setup[:live] || false
    ["load"].each do |_op|
      _should_skip, _reason = Runner.is_control_skipped("entityOp", "generate_corporate_bullshit." + _op, _live ? "live" : "unit")
      if _should_skip
        skip(_reason || "skipped via sdk-test-control.json")
        return
      end
    end
    # The basic flow consumes synthetic IDs from the fixture. In live mode
    # without an *_ENTID env override, those IDs hit the live API and 4xx.
    if setup[:synthetic_only]
      skip "live entity test uses synthetic IDs from fixture — set CORPORATEBULLSHITGENERATOR_TEST_GENERATE_CORPORATE_BULLSHIT_ENTID JSON to run live"
      return
    end
    client = setup[:client]

    # Bootstrap entity data from existing test data.
    generate_corporate_bullshit_ref01_data_raw = Vs.items(Helpers.to_map(
      Vs.getpath(setup[:data], "existing.generate_corporate_bullshit")))
    generate_corporate_bullshit_ref01_data = nil
    if generate_corporate_bullshit_ref01_data_raw.length > 0
      generate_corporate_bullshit_ref01_data = Helpers.to_map(generate_corporate_bullshit_ref01_data_raw[0][1])
    end

    # LOAD
    generate_corporate_bullshit_ref01_ent = client.GenerateCorporateBullshit(nil)
    generate_corporate_bullshit_ref01_match_dt0 = {}
    generate_corporate_bullshit_ref01_data_dt0_loaded = generate_corporate_bullshit_ref01_ent.load(generate_corporate_bullshit_ref01_match_dt0, nil)
    assert !generate_corporate_bullshit_ref01_data_dt0_loaded.nil?

  end
end

def generate_corporate_bullshit_basic_setup(extra)
  Runner.load_env_local

  entity_data_file = File.join(__dir__, "..", "..", ".sdk", "test", "entity", "generate_corporate_bullshit", "GenerateCorporateBullshitTestData.json")
  entity_data_source = File.read(entity_data_file)
  entity_data = JSON.parse(entity_data_source)

  options = {}
  options["entity"] = entity_data["existing"]

  client = CorporateBullshitGeneratorSDK.test(options, extra)

  # Generate idmap via transform.
  idmap = Vs.transform(
    ["generate_corporate_bullshit01", "generate_corporate_bullshit02", "generate_corporate_bullshit03"],
    {
      "`$PACK`" => ["", {
        "`$KEY`" => "`$COPY`",
        "`$VAL`" => ["`$FORMAT`", "upper", "`$COPY`"],
      }],
    }
  )

  # Detect ENTID env override before envOverride consumes it. When live
  # mode is on without a real override, the basic test runs against synthetic
  # IDs from the fixture and 4xx's. Surface this so the test can skip.
  entid_env_raw = ENV["CORPORATEBULLSHITGENERATOR_TEST_GENERATE_CORPORATE_BULLSHIT_ENTID"]
  idmap_overridden = !entid_env_raw.nil? && entid_env_raw.strip.start_with?("{")

  env = Runner.env_override({
    "CORPORATEBULLSHITGENERATOR_TEST_GENERATE_CORPORATE_BULLSHIT_ENTID" => idmap,
    "CORPORATEBULLSHITGENERATOR_TEST_LIVE" => "FALSE",
    "CORPORATEBULLSHITGENERATOR_TEST_EXPLAIN" => "FALSE",
  })

  idmap_resolved = Helpers.to_map(
    env["CORPORATEBULLSHITGENERATOR_TEST_GENERATE_CORPORATE_BULLSHIT_ENTID"])
  if idmap_resolved.nil?
    idmap_resolved = Helpers.to_map(idmap)
  end

  if env["CORPORATEBULLSHITGENERATOR_TEST_LIVE"] == "TRUE"
    merged_opts = Vs.merge([
      {
      },
      extra || {},
    ])
    client = CorporateBullshitGeneratorSDK.new(Helpers.to_map(merged_opts))
  end

  live = env["CORPORATEBULLSHITGENERATOR_TEST_LIVE"] == "TRUE"
  {
    client: client,
    data: entity_data,
    idmap: idmap_resolved,
    env: env,
    explain: env["CORPORATEBULLSHITGENERATOR_TEST_EXPLAIN"] == "TRUE",
    live: live,
    synthetic_only: live && !idmap_overridden,
    now: (Time.now.to_f * 1000).to_i,
  }
end
