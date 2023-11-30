import pytest
from pathlib import Path
from src.youtube import Youtube


@pytest.fixture
def downloader() -> Youtube:
    target_dir = Path()
    return Youtube(target_dir)


def test_init(downloader: Youtube):
    assert downloader


def test_liebe_liebe_sonne(downloader: Youtube):
    uri = "https://youtu.be/NQWvLHh7jVU?si=kW9Xh-ltM31yWX2B"
    audio_file = downloader.download(uri)

    assert audio_file.exists()


def test_bad_uri(downloader: Youtube):
    with pytest.raises(ValueError):
        uri = "https://tidal.com/3204972596"
        downloader.download(uri)
