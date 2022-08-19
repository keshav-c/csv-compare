defmodule CsvCompare do
  @moduledoc """
  Documentation for `CsvCompare`.
  """

  alias CsvCompare.Api

  def run(d_old \\ "22-08-10", d_new \\ "22-08-19") do
    {m1, m2} = Api.decode_2(d_old, d_new)
    numi = Api.new_shops(m1, m2)
    IO.puts("#{numi} new shops have installed since #{d_old}")
    numl = Api.lost_shops(m1, m2)
    IO.puts("#{numl} shops have uninstalled since #{d_old}")
  end
end
