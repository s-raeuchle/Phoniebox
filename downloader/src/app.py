from os import read
from re import U
import re
from csv_reader import CsvReader
from media_converter import MediaConverter
from youtube import Youtube


def download_songs() -> None:
    reader = CsvReader()
    youtube = Youtube()

    for uri, directory in zip(reader, reader.directories()):
        mp4_file = youtube.download(uri)
        mp3_file = MediaConverter.to_mp3(mp4_file)

        mp4_file.unlink()
        directory.mkdir(exist_ok=True, parents=True)
        moved_mp3_file = directory / mp3_file.name
        if not moved_mp3_file.exists():
            mp3_file.rename(moved_mp3_file)
        mp3_file.unlink()


if __name__ == "__main__":
    download_songs()
