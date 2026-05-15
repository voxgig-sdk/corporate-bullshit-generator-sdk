# CorporateBullshitGenerator SDK configuration

module CorporateBullshitGeneratorConfig
  def self.make_config
    {
      "main" => {
        "name" => "CorporateBullshitGenerator",
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
        },
      },
      "options" => {
        "base" => "https://corporatebs-generator.sameerkumar.website",
        "auth" => {
          "prefix" => "Bearer",
        },
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "generate_corporate_bullshit" => {},
        },
      },
      "entity" => {
        "generate_corporate_bullshit" => {
          "fields" => [
            {
              "name" => "phrase",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 0,
            },
          ],
          "name" => "generate_corporate_bullshit",
          "op" => {
            "load" => {
              "name" => "load",
              "points" => [
                {
                  "method" => "GET",
                  "orig" => "/",
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "active" => true,
                  "parts" => [],
                  "args" => {},
                  "select" => {},
                  "index$" => 0,
                },
              ],
              "input" => "data",
              "key$" => "load",
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    CorporateBullshitGeneratorFeatures.make_feature(name)
  end
end
