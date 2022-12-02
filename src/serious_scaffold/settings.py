"""Settings Module."""
import logging
from logging import getLevelName
from typing import Optional

from pydantic import BaseSettings


class Settings(BaseSettings):
    """Project specific settings."""

    logging_level: Optional[str] = getLevelName(logging.INFO)

    class Config:
        """Config for settings."""

        env_prefix = "SERIOUS_SCAFFOLD_"


class GlobalSettings(BaseSettings):
    """System level settings."""

    ci: bool = False


#: Instance for project specific settings.
settings = Settings()

#: Instance for system level settings.
global_settings = GlobalSettings()
