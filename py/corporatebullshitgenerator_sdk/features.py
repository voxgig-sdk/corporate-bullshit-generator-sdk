# CorporateBullshitGenerator SDK feature factory

from corporatebullshitgenerator_sdk.feature.base_feature import CorporateBullshitGeneratorBaseFeature
from corporatebullshitgenerator_sdk.feature.test_feature import CorporateBullshitGeneratorTestFeature


def _make_feature(name):
    features = {
        "base": lambda: CorporateBullshitGeneratorBaseFeature(),
        "test": lambda: CorporateBullshitGeneratorTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
