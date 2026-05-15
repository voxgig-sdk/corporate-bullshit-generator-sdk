<?php
declare(strict_types=1);

// CorporateBullshitGenerator SDK utility: prepare_body

class CorporateBullshitGeneratorPrepareBody
{
    public static function call(CorporateBullshitGeneratorContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
