from pathlib import Path
from src.media_converter import MediaConverter


def test_mp4_to_mp4():
    movie_file = Path("Liebe liebe Sonne (Megamix Cut [Mixed]).mp4")
    assert movie_file.exists()

    audio_file = MediaConverter.to_mp3(movie_file)
    assert audio_file.exists()
