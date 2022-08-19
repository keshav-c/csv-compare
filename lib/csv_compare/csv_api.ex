defmodule CsvCompare.CsvApi do
  alias CsvCompare.FileApi

  @headers ~w[shop prd_mid sbx_mid payment_ready]

  def decode(date) do
    date
    |> FileApi.get_stream()
    |> CSV.decode!(strip_fields: true, headers: true)
    |> Enum.to_list()
    |> MapSet.new()
  end

  def write_mapset_to_csv(ml, filename) do
    ml
    |> mapset_to_rowlist()
    |> write_rows_to_csv(filename)
  end

  def write_rows_to_csv(rows, out_filename) do
    csv_content =
      rows
      |> (&[@headers | &1]).()
      |> CSV.encode(delimiter: "")
      |> Enum.join("\n")

    {:ok, _} = FileApi.write_lines_to_file(csv_content, out_filename)
  end

  def mapset_to_rowlist(maplist) do
    maplist
    |> MapSet.to_list()
    |> Enum.map(fn m ->
      for h <- @headers, into: [], do: Map.fetch!(m, h)
    end)
  end

  def decode_basic(date) do
    date
    |> FileApi.get_stream()
    |> CSV.decode(strip_fields: true)
  end
end
