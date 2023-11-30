from abc import ABC
from pathlib import Path
import subprocess


class MediaConverter(ABC):
    @staticmethod
    def to_mp3(file: Path) -> Path:
        """converts a media file into the mp3-format."""
        mp3_file = file.with_suffix(".mp3")
        subprocess.run(["ffmpeg", "-i", file, mp3_file, "-n"])

        return mp3_file
