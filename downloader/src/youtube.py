from abc import ABC
from pathlib import Path
from pytube import YouTube


class Youtube(ABC):
    def __init__(self, target: Path = Path()) -> None:
        self._target = target

    def download(self, uri: str) -> Path:
        """downloads youtube video (audio only) in the mp4-format"""
        if not self._validate(uri):
            raise ValueError(f"given url ({uri}) is not valid!")
        youtube_uri = YouTube(uri)
        video_stream = youtube_uri.streams.filter(only_audio=True).first()

        audio_file = video_stream.download(output_path=self._target)

        return Path(audio_file)

    def _validate(self, uri: str) -> bool:
        """checks if the given url is a valid youtube link."""
        return uri.startswith("https://you")
