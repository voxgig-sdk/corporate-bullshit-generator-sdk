# CorporateBullshitGenerator SDK utility: make_context

from core.context import CorporateBullshitGeneratorContext


def make_context_util(ctxmap, basectx):
    return CorporateBullshitGeneratorContext(ctxmap, basectx)
