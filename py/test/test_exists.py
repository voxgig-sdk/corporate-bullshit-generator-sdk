# CorporateBullshitGenerator SDK exists test

import pytest
from corporatebullshitgenerator_sdk import CorporateBullshitGeneratorSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = CorporateBullshitGeneratorSDK.test(None, None)
        assert testsdk is not None
