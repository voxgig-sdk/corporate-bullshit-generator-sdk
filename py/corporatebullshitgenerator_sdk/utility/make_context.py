# CorporateBullshitGenerator SDK utility: make_context

from corporatebullshitgenerator_sdk.core.context import CorporateBullshitGeneratorContext


def make_context_util(ctxmap, basectx):
    return CorporateBullshitGeneratorContext(ctxmap, basectx)
