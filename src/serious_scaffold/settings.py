"""Settings."""
import logging
from logging import getLevelName
from typing import Optional

from pydantic import BaseSettings


class Settings(BaseSettings):
    """Settings."""

    logging_level: Optional[str] = getLevelName(logging.INFO)

    class Config:
        """Config for settings."""

        env_prefix = "SERIOUS_SCAFFOLD_"


class GlobalSettings(BaseSettings):
    """Global Settings."""

    ci: bool = False


settings = Settings()
global_settings = GlobalSettings()
