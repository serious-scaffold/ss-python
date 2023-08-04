"""Settings Module."""
from __future__ import annotations

import logging
from logging import getLevelName

from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    """Project specific settings."""

    logging_level: str | None = getLevelName(logging.INFO)
    """Default logging level for the project."""

    model_config = SettingsConfigDict(
        env_prefix="SERIOUS_SCAFFOLD_",
    )


class GlobalSettings(BaseSettings):
    """System level settings."""

    ci: bool = False
    """Indicator for whether or not in CI/CD environment."""


#: Instance for project specific settings.
settings = Settings()

#: Instance for system level settings.
global_settings = GlobalSettings()
