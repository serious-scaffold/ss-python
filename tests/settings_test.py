"""Test for settings."""

import os

from ss_python.settings import global_settings, settings


def test_settings() -> None:
    """Test for settings."""
    assert settings.logging_level == os.getenv(
        "SS_PYTHON_LOGGING_LEVEL",
        "INFO",
    )
    assert str(global_settings.ci).lower() == os.getenv("CI", "False").lower()
