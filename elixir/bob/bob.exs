defmodule Teenager do
  def hey(input) do
    cond do
      peepless?(input)           -> "Fine. Be that way!"
      shouting?(input)          -> "Whoa, chill out!"
      has_question_mark?(input) -> "Sure."
      input                     -> "Whatever."
    end
  end

  defp peepless?(input) do
    String.strip(input) == ""
  end

  defp shouting?(input) do
    input == String.upcase(input) && letters?(input)
  end

  defp has_question_mark?(input) do
    String.ends_with?(input, "?")
  end

  @doc """
    Can't just test English alphabet here.
    It was tough to find the correct regex
  """
  defp letters?(input) do
    Regex.match?(~r/\p{L}+/, input)
  end
end
