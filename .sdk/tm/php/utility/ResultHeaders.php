<?php
declare(strict_types=1);

// CorporateBullshitGenerator SDK utility: result_headers

class CorporateBullshitGeneratorResultHeaders
{
    public static function call(CorporateBullshitGeneratorContext $ctx): ?CorporateBullshitGeneratorResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
