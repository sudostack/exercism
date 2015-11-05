defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    Regex.scan(~r/[ 0-9\-\_\p{L}+]/, sentence)
    |> List.flatten
    |> Enum.join
    |> String.replace(~r/[:,]/, "")
    |> String.replace(~r/[_]/, " ")
    |> String.downcase
    |> String.split
    |> Enum.reduce(%{}, fn(word, acc) ->
      cond do
        Map.has_key?(acc, word) -> Map.put(acc, word, acc[word]+1)
        true                    -> Map.put(acc, word, 1)
      end
    end)
  end
end
