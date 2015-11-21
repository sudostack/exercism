defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"], "b" => ["BALLAST", "BEAUTY"]})
  %{"ability" => "a", "aardvark" => "a", "ballast" => "b", "beauty" =>"b"}
  """
  @spec transform(Dict.t) :: map()
  def transform(input) do
    Enum.reduce(Map.keys(input), %{}, fn point, acc ->
      list_mapper(acc, input[point], point)
    end)
  end

  def list_mapper(source, list, key) do
    Enum.reduce(list, source, fn word, src ->
      Map.update(src, String.downcase(word), 1, &(&1 + 1))
    end)
  end
end
