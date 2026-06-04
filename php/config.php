<?php
declare(strict_types=1);

// CorporateBullshitGenerator SDK configuration

class CorporateBullshitGeneratorConfig
{
    public static function make_config(): array
    {
        return [
            "main" => [
                "name" => "CorporateBullshitGenerator",
            ],
            "feature" => [
                "test" => [
          'options' => [
            'active' => false,
          ],
        ],
            ],
            "options" => [
                "base" => "https://corporatebs-generator.sameerkumar.website",
                "headers" => [
          'content-type' => 'application/json',
        ],
                "entity" => [
                    "generate_corporate_bullshit" => [],
                ],
            ],
            "entity" => [
        'generate_corporate_bullshit' => [
          'fields' => [
            [
              'name' => 'phrase',
              'req' => false,
              'type' => '`$STRING`',
              'active' => true,
              'index$' => 0,
            ],
          ],
          'name' => 'generate_corporate_bullshit',
          'op' => [
            'load' => [
              'name' => 'load',
              'points' => [
                [
                  'method' => 'GET',
                  'orig' => '/',
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'active' => true,
                  'parts' => [],
                  'args' => [],
                  'select' => [],
                  'index$' => 0,
                ],
              ],
              'input' => 'data',
              'key$' => 'load',
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
      ],
        ];
    }


    public static function make_feature(string $name)
    {
        require_once __DIR__ . '/features.php';
        return CorporateBullshitGeneratorFeatures::make_feature($name);
    }
}
