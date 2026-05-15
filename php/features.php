<?php
declare(strict_types=1);

// CorporateBullshitGenerator SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class CorporateBullshitGeneratorFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new CorporateBullshitGeneratorBaseFeature();
            case "test":
                return new CorporateBullshitGeneratorTestFeature();
            default:
                return new CorporateBullshitGeneratorBaseFeature();
        }
    }
}
