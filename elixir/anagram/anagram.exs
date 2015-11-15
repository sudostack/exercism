defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    # iterate over candidates
    # take each letter in the candidate
    # Enum.each(candidates, &(characters/1))
    Enum.each(candidates, &(IO.inspect(characters(&1))))
    # find the index of that char in base
    # if it ever returns `nil` then proceed to next candidate
    # otherwise return the candidate
  end

  defp characters(string), do: String.split(string, "") |> Enum.take(String.length(string))

  # defp char_found?(char, char_list), do: Enum.find_value(char_list, &(&1 == char))
end
