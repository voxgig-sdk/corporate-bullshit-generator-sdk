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
              "active" => true,
              "name" => "phrase",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 0,
            },
          ],
          "name" => "generate_corporate_bullshit",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "active" => true,
                  "args" => {},
                  "method" => "GET",
                  "orig" => "/",
                  "parts" => [],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
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
