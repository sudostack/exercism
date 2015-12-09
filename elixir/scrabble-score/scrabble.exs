# require IEx
defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t) :: non_neg_integer
  def score(word) do
    word
    |> String.strip
    |> String.split("", trim: true)
    |> Enum.reduce(0, fn char, accum ->
      accum + letter_score(char)
    end)
  end

  @letter_scores %{
    1  => ~w(A E I O U L N R S T),
    2  => ~w(D G),
    3  => ~w(B C M P),
    4  => ~w(F H V W Y),
    5  => ~w(K),
    8  => ~w(J X),
    10 => ~w(Q Z)
  }

  def letter_score(char) do
    ltr_score = 0

    Enum.each @letter_scores, fn score_tup ->
      # IEx.pry
      if String.contains?(String.upcase(char), elem(score_tup, 1)) do
        ltr_score = elem(score_tup, 0)
      end
    end

    ltr_score
  end

  # defp occurrence(word, char) do
  #   Regex.scan(~r/#{char}/, word)
  #   |> Enum.count
  # end
end
