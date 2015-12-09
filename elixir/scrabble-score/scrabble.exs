defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t) :: non_neg_integer
  def score(word) do
    word
    |> String.strip
    |> String.split("", trim: true)
    |> Enum.reduce 0, &(letter_score(&1) + &2)
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

  defp letter_score(char) do
    result = Enum.filter @letter_scores, fn score_tup ->
      String.contains?(String.upcase(char), elem(score_tup, 1))
    end

    result |> hd |> elem(0)
  end
end
