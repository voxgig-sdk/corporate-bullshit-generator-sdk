

import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'
import { createLiveTransport } from '../../live-runner'
import { runLiveEntity } from '../../live-entity'


import { CorporateBullshitGeneratorSDK, BaseFeature, stdutil } from '../../..'

import {
  envOverride,
  liveClientOptions,
  liveDelay,
  loadEnvLocal,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
  maybeSkipControl,
} from '../../utility'


// AFTER the imports on purpose: TypeScript hoists `import` above any
// statement in the emitted CommonJS, so a loader placed above them would
// run only after every imported module had already been evaluated - and
// anything reading process.env at module scope would miss these values.
loadEnvLocal(__dirname + '/../../../.env.local')


describe('GenerateCorporateBullshitEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when CORPORATE_BULLSHIT_GENERATOR_TEST_LIVE=TRUE.
  afterEach(liveDelay('CORPORATE_BULLSHIT_GENERATOR_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = CorporateBullshitGeneratorSDK.test()
    const ent = testsdk.GenerateCorporateBullshit()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.CORPORATE_BULLSHIT_GENERATOR_TEST_LIVE
    for (const op of ['load']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'generate_corporate_bullshit.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[{"active":true,"name":"phrase","req":false,"short":"The generated corporate bullshit phrase","type":"`$STRING`","index$":0}],"name":"generate_corporate_bullshit","op":{"load":{"input":"data","name":"load","points":[{"active":true,"args":{},"contract":{"id":"GET /","json":"{\"operationId\":\"generateCorporateBullshit\",\"parameters\":[],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"examples\":{\"example1\":{\"summary\":\"Example corporate phrase 1\",\"value\":{\"phrase\":\"Quickly cloudify equity invested collaboration and idea-sharing\"}},\"example2\":{\"summary\":\"Example corporate phrase 2\",\"value\":{\"phrase\":\"Efficiently build empowered networks\"}}},\"schema\":{\"properties\":{\"phrase\":{\"description\":\"The generated corporate bullshit phrase\",\"example\":\"Quickly cloudify equity invested collaboration and idea-sharing\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Successfully generated a corporate bullshit phrase\",\"headers\":{\"Access-Control-Allow-Origin\":{\"description\":\"CORS header allowing cross-origin requests\",\"schema\":{\"type\":\"string\"}}}},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"error\":{\"description\":\"Error message\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/","segments":[],"select":{},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"load"}},"relations":{"ancestors":[]},"key$":"generate_corporate_bullshit","name__orig":"generate_corporate_bullshit","Name":"GenerateCorporateBullshit","name_":"generate_corporate_bullshit","name-":"generate-corporate-bullshit","NAME":"GENERATE_CORPORATE_BULLSHIT","index$":0}, {"active":true,"entity":"generate_corporate_bullshit","key$":"BasicGenerateCorporateBullshitFlow","kind":"basic","name":"BasicGenerateCorporateBullshitFlow","param":{},"step":[{"active":true,"data":{},"input":{"ref":"generate_corporate_bullshit_ref01","srcdatavar":"generate_corporate_bullshit_ref01_data","suffix":"_dt0"},"match":{},"op":"load","spec":[],"valid":[{"apply":"TextFieldMark","def":{"mark":"Mark01-generate_corporate_bullshit_ref01"}}],"index$":0}]}, 'GenerateCorporateBullshit')
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let generate_corporate_bullshit_ref01_data = Object.values(setup.data.existing.generate_corporate_bullshit)[0] as any

    // LOAD
    const generate_corporate_bullshit_ref01_ent = client.GenerateCorporateBullshit()
    const generate_corporate_bullshit_ref01_match_dt0: any = {}
    const generate_corporate_bullshit_ref01_data_dt0 = (await generate_corporate_bullshit_ref01_ent.load(generate_corporate_bullshit_ref01_match_dt0)).data()
    assert(null != generate_corporate_bullshit_ref01_data_dt0)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/generate_corporate_bullshit/GenerateCorporateBullshitTestData.json')

  // TODO: file ready util needed?
  const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8')

  // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
  const entityData = JSON.parse(entityDataSource)

  options.entity = entityData.existing

  let client = CorporateBullshitGeneratorSDK.test(options, extra)
  const struct = client.utility().struct
  const merge = struct.merge
  const transform = struct.transform

  let idmap = transform(
    ['generate_corporate_bullshit01','generate_corporate_bullshit02','generate_corporate_bullshit03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'CORPORATE_BULLSHIT_GENERATOR_TEST_GENERATE_CORPORATE_BULLSHIT_ENTID': idmap,
    'CORPORATE_BULLSHIT_GENERATOR_TEST_LIVE': 'FALSE',
    'CORPORATE_BULLSHIT_GENERATOR_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['CORPORATE_BULLSHIT_GENERATOR_TEST_GENERATE_CORPORATE_BULLSHIT_ENTID']

  const live = 'TRUE' === env.CORPORATE_BULLSHIT_GENERATOR_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['CORPORATE_BULLSHIT_GENERATOR_TEST_GENERATE_CORPORATE_BULLSHIT_ENTID']
    idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {}
    if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
      throw new Error('Live ENTID must be a JSON object')
    }
    client = new CorporateBullshitGeneratorSDK(merge([
      // FIRST, so the generated fields below win: sdk-test-control.json's
      // test.client.options adds to the live client, it does not redirect it.
      liveClientOptions(),
      {
      },
      // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when the
      // last entry is undefined, and basicSetup is normally called with no
      // argument at all - so a bare 'extra' silently discarded the apikey
      // and server values above and handed the SDK undefined. Harmless
      // while there was nothing in that object; not harmless now.
      extra || {},
      { system: { fetch: transport.fetch } }
    ]))
  }

  const setup = {
    idmap,
    env,
    options,
    client,
    struct,
    data: entityData,
    explain: 'TRUE' === env.CORPORATE_BULLSHIT_GENERATOR_TEST_EXPLAIN,
    live,
    transport,
    now: Date.now(),
  }

  return setup
}
  
