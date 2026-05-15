<?php
declare(strict_types=1);

// CorporateBullshitGenerator SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class CorporateBullshitGeneratorMakeContext
{
    public static function call(array $ctxmap, ?CorporateBullshitGeneratorContext $basectx): CorporateBullshitGeneratorContext
    {
        return new CorporateBullshitGeneratorContext($ctxmap, $basectx);
    }
}
