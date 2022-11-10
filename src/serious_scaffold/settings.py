# -*- coding: utf-8 -*-
"""Settings."""
import logging
from logging import getLevelName
from typing import Optional

from pydantic import BaseSettings


class Settings(BaseSettings):  # pylint: disable=too-few-public-methods
    """Settings."""

    logging_level: Optional[str] = getLevelName(logging.INFO)

    class Config:  # pylint: disable=too-few-public-methods
        """Config for settings."""

        env_prefix = "SERIOUS_SCAFFOLD_"


class GlobalSettings(BaseSettings):  # pylint: disable=too-few-public-methods
    """Global Settings."""

    ci: bool = False


settings = Settings()
global_settings = GlobalSettings()
