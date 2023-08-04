"""Settings Module."""
import logging
from logging import getLevelName
from typing import Optional

from pydantic_settings import BaseSettings, SettingsConfigDict


class GlobalSettings(BaseSettings):
    """System level settings."""

    ci: bool = False
    """Indicator for whether or not in CI/CD environment."""


class Settings(BaseSettings):
    """Project specific settings."""

    # NOTE(huxuan): Pydantic cannot leverage future annotations at runtime prior to
    # Python 3.10, so `from __future__ import annotations` cannot be used here, and the
    # lint error need to be ignored unless the minimal Python version >= 3.10.
    # Reference: https://github.com/pydantic/pydantic/issues/3300#issuecomment-1034007897
    logging_level: Optional[str] = getLevelName(logging.INFO)  # noqa: FA100
    """Default logging level for the project."""

    model_config = SettingsConfigDict(
        env_prefix="SERIOUS_SCAFFOLD_",
    )


# NOTE(huxuan): `#:` style docstring is required for module attributes to satisfy both
# autodoc [1] and `check-docstring-first` in `pre-commit` [2].
# [1] https://www.sphinx-doc.org/en/master/usage/extensions/autodoc.html#directive-autoattribute
# [2] https://github.com/pre-commit/pre-commit-hooks/issues/159#issuecomment-559886109

#: Instance for system level settings.
global_settings = GlobalSettings()

#: Instance for project specific settings.
settings = Settings()
