# CsvCompare

This is a simple project that tracks changes in a CSV database. The input to `CsvCompare.run` are 2 files representing the CSV database at different points in time. The assumption is that all row data in database is unique. This lets us turn the rows of the database into a [MapSet](https://hexdocs.pm/elixir/1.13/MapSet.html) and compare the 2 versions for changes that occurred over time.

It uses the [CSV](https://hexdocs.pm/csv/CSV.html) library to read the CSV files.

We assume the CSV files have a header row and the header names can be set in _lib/csv_compare/csv_api.ex_

## Run

Navigate to the folder and run `iex -S mix`
Then run:

`CsvCompare.run("old.csv", "new.csv")`

_old.csv_ and _new.csv_ should be in the _/data_ folder.
The diffs are generated in the _/out_ folder.
