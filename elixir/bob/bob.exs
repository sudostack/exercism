defmodule Teenager do
  def hey(input) do
    cond do
      no_peep?(input)           -> "Fine. Be that way!"
      shouting?(input)          -> "Whoa, chill out!"
      has_question_mark?(input) -> "Sure."
      input                     -> "Whatever."
    end
  end

  defp no_peep?(input) do
    String.strip(input) == ""
  end

  defp shouting?(input) do
    input == String.upcase(input) && letters?(input)
  end

  defp has_question_mark?(input) do
    String.ends_with?(input, "?")
  end

  defp letters?(input) do
    # Regex.match?(~r/[a-zA-Z]/, input)
    Regex.match?(~r/\p{L}+/, input)
  end
end
