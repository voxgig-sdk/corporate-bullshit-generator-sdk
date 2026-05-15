<?php
declare(strict_types=1);

// CorporateBullshitGenerator SDK utility: result_body

class CorporateBullshitGeneratorResultBody
{
    public static function call(CorporateBullshitGeneratorContext $ctx): ?CorporateBullshitGeneratorResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
