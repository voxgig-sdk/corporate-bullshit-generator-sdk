# CorporateBullshitGenerator SDK feature factory

from feature.base_feature import CorporateBullshitGeneratorBaseFeature
from feature.test_feature import CorporateBullshitGeneratorTestFeature


def _make_feature(name):
    features = {
        "base": lambda: CorporateBullshitGeneratorBaseFeature(),
        "test": lambda: CorporateBullshitGeneratorTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
