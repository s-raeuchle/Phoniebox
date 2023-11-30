import pytest
from pathlib import Path
from src.csv_reader import CsvReader


@pytest.fixture
def reader() -> CsvReader:
    return CsvReader()


def test_init(reader: CsvReader) -> None:
    assert reader


def test_len(reader: CsvReader) -> None:
    assert len(reader) == 1


def test_titles(reader: CsvReader) -> None:
    titles = reader.titles()

    assert len(titles) > 0


def test_uris(reader: CsvReader) -> None:
    uris = reader.uris()

    assert len(uris) > 0


def test_directories(reader: CsvReader) -> None:
    directories = reader.directories()

    assert len(directories) > 0


def test_no_file_found() -> None:
    with pytest.raises(FileNotFoundError):
        CsvReader(csv_file=Path())
