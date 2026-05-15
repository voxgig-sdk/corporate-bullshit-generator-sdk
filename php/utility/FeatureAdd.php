<?php
declare(strict_types=1);

// CorporateBullshitGenerator SDK utility: feature_add

class CorporateBullshitGeneratorFeatureAdd
{
    public static function call(CorporateBullshitGeneratorContext $ctx, mixed $f): void
    {
        $ctx->client->features[] = $f;
    }
}
