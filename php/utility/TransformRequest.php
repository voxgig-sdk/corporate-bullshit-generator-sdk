<?php
declare(strict_types=1);

// CorporateBullshitGenerator SDK utility: transform_request

require_once __DIR__ . '/../core/Helpers.php';

class CorporateBullshitGeneratorTransformRequest
{
    public static function call(CorporateBullshitGeneratorContext $ctx): mixed
    {
        $spec = $ctx->spec;
        $point = $ctx->point;
        if ($spec) {
            $spec->step = 'reqform';
        }
        $transform = CorporateBullshitGeneratorHelpers::to_map(\Voxgig\Struct\Struct::getprop($point, 'transform'));
        if (!$transform) {
            return $ctx->reqdata;
        }
        $reqform = \Voxgig\Struct\Struct::getprop($transform, 'req');
        if (!$reqform) {
            return $ctx->reqdata;
        }
        return \Voxgig\Struct\Struct::transform(['reqdata' => $ctx->reqdata], $reqform);
    }
}
