"""Provides access to the low-level framework libraries"""

try:
    from ._core import *
except ModuleNotFoundError:
    # developer setup
    from _core import *
