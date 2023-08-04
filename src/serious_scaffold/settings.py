"""Settings Module."""
from __future__ import annotations

import logging
from logging import getLevelName

from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    """Project specific settings."""

    model_config = SettingsConfigDict(
        env_prefix="SERIOUS_SCAFFOLD_",
    )

    logging_level: str | None = getLevelName(logging.INFO)


class GlobalSettings(BaseSettings):
    """System level settings."""

    ci: bool = False


#: Instance for project specific settings.
settings = Settings()

#: Instance for system level settings.
global_settings = GlobalSettings()
