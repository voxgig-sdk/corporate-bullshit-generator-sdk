package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewGenerateCorporateBullshitEntityFunc func(client *CorporateBullshitGeneratorSDK, entopts map[string]any) CorporateBullshitGeneratorEntity

