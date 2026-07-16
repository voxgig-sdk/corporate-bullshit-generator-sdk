<?php
declare(strict_types=1);

// CorporateBullshitGenerator SDK base feature

class CorporateBullshitGeneratorBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    // Positions this feature when added via the client `extend` option:
    // "__before__" / "__after__" / "__replace__" name an already-added
    // feature (mirrors the ts feature `_options`). Declared so setting it
    // on an extension instance avoids the dynamic-property deprecation.
    public ?array $_options = null;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(CorporateBullshitGeneratorContext $ctx, array $options): void {}
    public function PostConstruct(CorporateBullshitGeneratorContext $ctx): void {}
    public function PostConstructEntity(CorporateBullshitGeneratorContext $ctx): void {}
    public function SetData(CorporateBullshitGeneratorContext $ctx): void {}
    public function GetData(CorporateBullshitGeneratorContext $ctx): void {}
    public function GetMatch(CorporateBullshitGeneratorContext $ctx): void {}
    public function SetMatch(CorporateBullshitGeneratorContext $ctx): void {}
    public function PrePoint(CorporateBullshitGeneratorContext $ctx): void {}
    public function PreSpec(CorporateBullshitGeneratorContext $ctx): void {}
    public function PreRequest(CorporateBullshitGeneratorContext $ctx): void {}
    public function PreResponse(CorporateBullshitGeneratorContext $ctx): void {}
    public function PreResult(CorporateBullshitGeneratorContext $ctx): void {}
    public function PreDone(CorporateBullshitGeneratorContext $ctx): void {}
    public function PreUnexpected(CorporateBullshitGeneratorContext $ctx): void {}
}
