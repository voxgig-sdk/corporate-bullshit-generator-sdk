# CorporateBullshitGenerator SDK configuration


def make_config():
    return {
        "main": {
            "name": "CorporateBullshitGenerator",
        },
        "feature": {
            "test": {
        "options": {
          "active": False,
        },
      },
        },
        "options": {
            "base": "https://corporatebs-generator.sameerkumar.website",
            "headers": {
        "content-type": "application/json",
      },
            "entity": {
                "generate_corporate_bullshit": {},
            },
        },
        "entity": {
      "generate_corporate_bullshit": {
        "fields": [
          {
            "active": True,
            "name": "phrase",
            "req": False,
            "type": "`$STRING`",
            "index$": 0,
          },
        ],
        "name": "generate_corporate_bullshit",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "active": True,
                "args": {},
                "method": "GET",
                "orig": "/",
                "parts": [],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "load",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
