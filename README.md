# CorporateBullshitGenerator SDK

Generate random corporate buzzword phrases for slide decks, demos, and mock-ups

> TypeScript, Python, PHP, Golang, Ruby, Lua SDKs, a CLI, an interactive REPL, and an MCP server for AI agents — all generated from one OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).

## About Corporate Bullshit Generator

The Corporate Bullshit Generator API is a small hobby service that returns one random corporate-jargon phrase per call, mimicking the buzzword-laden language of business slide decks. It is maintained by Sameer Kumar and hosted at [corporatebs-generator.sameerkumar.website](https://corporatebs-generator.sameerkumar.website).

What you get from the API:

- A single GET endpoint at the root URL that returns a JSON object containing one randomly generated corporate phrase (for example, "Quickly Leverage Existing Business Scenarios").
- No parameters, no authentication, and no body required.

Operational notes: the community catalogue lists no documented rate limits or authentication, and reports CORS as disabled, so browser-side calls may need a proxy. Treat it as a fun utility for demos, placeholder content, and humour rather than a critical dependency.

## Try it

**TypeScript**
```bash
npm install corporate-bullshit-generator
```

**Python**
```bash
pip install corporate-bullshit-generator-sdk
```

**PHP**
```bash
composer require voxgig/corporate-bullshit-generator-sdk
```

**Golang**
```bash
go get github.com/voxgig-sdk/corporate-bullshit-generator-sdk/go
```

**Ruby**
```bash
gem install corporate-bullshit-generator-sdk
```

**Lua**
```bash
luarocks install corporate-bullshit-generator-sdk
```

## 30-second quickstart

### TypeScript

```ts
import { CorporateBullshitGeneratorSDK } from 'corporate-bullshit-generator'

const client = new CorporateBullshitGeneratorSDK({})

```

See the [TypeScript README](ts/README.md) for the
full guide, or scroll down for the same example in other languages.

## What's in the box

| Surface | Use it for | Path |
| --- | --- | --- |
| **SDK** (TypeScript, Python, PHP, Golang, Ruby, Lua) | App integration | `ts/` `py/` `php/` `go/` `rb/` `lua/` |
| **CLI** | Scripts, CI, ops, one-off API calls | `go-cli/` |
| **MCP server** | AI agents (Claude, Cursor, Cline) | `go-mcp/` |

## Use it from an AI agent (MCP)

The generated MCP server exposes every operation in this SDK as an
[MCP](https://modelcontextprotocol.io) tool that Claude, Cursor or Cline
can call directly. Build and register it:

```bash
cd go-mcp && go build -o corporate-bullshit-generator-mcp .
```

Then add it to your agent's MCP config (Claude Desktop, Cursor, etc.):

```json
{
  "mcpServers": {
    "corporate-bullshit-generator": {
      "command": "/abs/path/to/corporate-bullshit-generator-mcp"
    }
  }
}
```

## Entities

The API exposes one entity:

| Entity | Description | API path |
| --- | --- | --- |
| **GenerateCorporateBullshit** |  | `/` |

Each entity supports the following operations where available: **load**,
**list**, **create**, **update**, and **remove**.

## Quickstart in other languages

### Python

```python
from corporatebullshitgenerator_sdk import CorporateBullshitGeneratorSDK

client = CorporateBullshitGeneratorSDK({})


# Load a specific generatecorporatebullshit
generatecorporatebullshit, err = client.GenerateCorporateBullshit(None).load(
    {"id": "example_id"}, None
)
```

### PHP

```php
<?php
require_once 'corporatebullshitgenerator_sdk.php';

$client = new CorporateBullshitGeneratorSDK([]);


// Load a specific generatecorporatebullshit
[$generatecorporatebullshit, $err] = $client->GenerateCorporateBullshit(null)->load(
    ["id" => "example_id"], null
);
```

### Golang

```go
import sdk "github.com/voxgig-sdk/corporate-bullshit-generator-sdk/go"

client := sdk.NewCorporateBullshitGeneratorSDK(map[string]any{})

```

### Ruby

```ruby
require_relative "CorporateBullshitGenerator_sdk"

client = CorporateBullshitGeneratorSDK.new({})


# Load a specific generatecorporatebullshit
generatecorporatebullshit, err = client.GenerateCorporateBullshit(nil).load(
  { "id" => "example_id" }, nil
)
```

### Lua

```lua
local sdk = require("corporate-bullshit-generator_sdk")

local client = sdk.new({})


-- Load a specific generatecorporatebullshit
local generatecorporatebullshit, err = client:GenerateCorporateBullshit(nil):load(
  { id = "example_id" }, nil
)
```

## Unit testing in offline mode

Every SDK ships a test mode that swaps the HTTP transport for an
in-memory mock, so unit tests run offline.

### TypeScript

```ts
const client = CorporateBullshitGeneratorSDK.test()
const result = await client.GenerateCorporateBullshit().load({ id: 'test01' })
// result.ok === true, result.data contains mock data
```

### Python

```python
client = CorporateBullshitGeneratorSDK.test(None, None)
result, err = client.GenerateCorporateBullshit(None).load(
    {"id": "test01"}, None
)
```

### PHP

```php
$client = CorporateBullshitGeneratorSDK::test(null, null);
[$result, $err] = $client->GenerateCorporateBullshit(null)->load(
    ["id" => "test01"], null
);
```

### Golang

```go
client := sdk.TestSDK(nil, nil)
result, err := client.GenerateCorporateBullshit(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
```

### Ruby

```ruby
client = CorporateBullshitGeneratorSDK.test(nil, nil)
result, err = client.GenerateCorporateBullshit(nil).load(
  { "id" => "test01" }, nil
)
```

### Lua

```lua
local client = sdk.test(nil, nil)
local result, err = client:GenerateCorporateBullshit(nil):load(
  { id = "test01" }, nil
)
```

## How it works

Every SDK call runs the same five-stage pipeline:

1. **Point** — resolve the API endpoint from the operation definition.
2. **Spec** — build the HTTP specification (URL, method, headers, body).
3. **Request** — send the HTTP request.
4. **Response** — receive and parse the response.
5. **Result** — extract the result data for the caller.

A feature hook fires at each stage (e.g. `PrePoint`, `PreSpec`,
`PreRequest`), so features can inspect or modify the pipeline without
forking the SDK.

### Features

| Feature | Purpose |
| --- | --- |
| **TestFeature** | In-memory mock transport for testing without a live server |

Pass custom features via the `extend` option at construction time.

### Direct and Prepare

For endpoints the entity model doesn't cover, use the low-level methods:

- **`direct(fetchargs)`** — build and send an HTTP request in one step.
- **`prepare(fetchargs)`** — build the request without sending it.

Both accept a map with `path`, `method`, `params`, `query`,
`headers`, and `body`. See the [How-to guides](#how-to-guides) below.

## How-to guides

### Make a direct API call

When the entity interface does not cover an endpoint, use `direct`:

**TypeScript:**
```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})
console.log(result.data)
```

**Python:**
```python
result, err = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})
```

**PHP:**
```php
[$result, $err] = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);
```

**Go:**
```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
```

**Ruby:**
```ruby
result, err = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})
```

**Lua:**
```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
```

## Per-language documentation

- [TypeScript](ts/README.md)
- [Python](py/README.md)
- [PHP](php/README.md)
- [Golang](go/README.md)
- [Ruby](rb/README.md)
- [Lua](lua/README.md)

## Using the Corporate Bullshit Generator

- Upstream: [https://corporatebs-generator.sameerkumar.website](https://corporatebs-generator.sameerkumar.website)
- API docs: [https://freepublicapis.com/corporate-bullshit-generator](https://freepublicapis.com/corporate-bullshit-generator)

- Distributed under the BSD-3-Clause license.
- Free to use in personal and commercial projects with attribution.
- The API itself is a hobby service with no stated SLA; rely on it accordingly.

---

Generated from the Corporate Bullshit Generator OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).
