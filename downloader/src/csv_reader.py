import csv
from abc import ABC
from pathlib import Path
from typing import List, Self


class CsvReader(ABC):
    """Service to access a csv list of songs in the format: title,uri,directory"""

    def __init__(self, csv_file: Path = Path("youtube.csv")) -> None:
        if not csv_file.exists() or not csv_file.is_file():
            raise FileNotFoundError(
                f"Could not found Youtube csv file at location: {csv_file.absolute()}"
            )
        self._file = csv_file
        self._index = 0

    def titles(self) -> List[str]:
        """fetch all titles from the csv file"""
        with self._file.open("r") as csv_file:
            csv_reader = csv.reader(csv_file, delimiter=";")
            next(csv_reader)  # skip header

            return [row[0] for row in csv_reader]

    def uris(self) -> List[str]:
        """fetch all uris from the csv file"""
        with self._file.open("r") as csv_file:
            csv_reader = csv.reader(csv_file, delimiter=";")
            next(csv_reader)  # skip header

            return [row[1] for row in csv_reader]

    def directories(self) -> List[Path]:
        """fetch all directories from the csv file"""
        with self._file.open("r") as csv_file:
            csv_reader = csv.reader(csv_file, delimiter=";")
            next(csv_reader)  # skip header

            return [Path(row[2]) for row in csv_reader]

    def __len__(self) -> int:
        return len(self.titles())

    def __iter__(self) -> Self:
        return self

    def __next__(self) -> str:
        if self._index < len(self):
            item = self.uris()[self._index]
            self._index += 1
            return item
        else:
            raise StopIteration

    def print(self) -> None:
        print(*self.uris, sep="\n")
