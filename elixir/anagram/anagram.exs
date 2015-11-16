defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    Enum.filter candidates, fn candidate ->
      !is_source_word?(base, candidate) && is_match?(base, candidate)
    end
  end

  defp is_match?(str1, str2) do
    string_list(String.downcase(str1)) === string_list(String.downcase(str2))
  end

  defp is_source_word?(str1, str2) do
    String.downcase(str1) === String.downcase(str2)
  end

  defp string_list(string) do
    String.split(string, "", trim: true) |> Enum.sort
  end
end
