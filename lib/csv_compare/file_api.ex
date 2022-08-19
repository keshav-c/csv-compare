defmodule CsvCompare.FileApi do
  def get_stream(date) do
    "data/#{date}-pixel.csv"
    |> Path.expand()
    |> File.stream!()
  end

  def write_lines_to_file(lines, filename) do
    Path.expand("out/#{filename}")
    |> File.open([:write], fn file ->
      :ok = IO.write(file, lines)
    end)
  end
end
