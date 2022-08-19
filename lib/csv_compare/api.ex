defmodule CsvCompare.Api do
  alias CsvCompare.CsvApi

  def lost_shops(m1, m2) do
    in_both = MapSet.intersection(m1, m2)
    lost = MapSet.difference(m1, in_both)

    CsvApi.write_mapset_to_csv(lost, "uninstalled.csv")
    MapSet.size(lost)
  end

  def new_shops(m1, m2) do
    added = MapSet.difference(m2, m1)

    CsvApi.write_mapset_to_csv(added, "new_installed.csv")
    MapSet.size(added)
  end

  def decode_2(d1, d2) do
    m1 = CsvApi.decode(d1)
    IO.puts("#{d1} has #{MapSet.size(m1)} shops")
    m2 = CsvApi.decode(d2)
    IO.puts("#{d2} has #{MapSet.size(m2)} shops")
    {m1, m2}
  end
end
