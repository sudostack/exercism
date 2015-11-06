defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence
    |> get_chars
    |> strip_chars
    |> String.downcase
    |> String.split
    |> word_map
  end

  defp get_chars(string) do
    Regex.scan(~r/[ 0-9\-\_\p{L}+]/, string)
    |> List.flatten
    |> Enum.join
  end

  defp strip_chars(string) do
    String.replace(string, ~r/[:,]/, "") |> String.replace(~r/[_]/, " ")
  end

  defp word_map(list) do
    Enum.reduce(list, %{}, fn(word, map) ->
      Map.update(map, word, 1, &(&1 + 1))
    end)
  end
end
