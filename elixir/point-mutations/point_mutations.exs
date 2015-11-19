defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  4
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2) do
    compare(strand1, strand2)
  end

  defp compare(a, b, acc \\ 0)
  defp compare([], [], acc), do: acc
  defp compare([], _, _), do: nil
  defp compare(_, [], _), do: nil
  defp compare([head1|tail1], [head2|tail2], acc) do
    cond do
      head1 === head2 -> compare(tail1, tail2, acc)
      head1 !== head2 -> compare(tail1, tail2, acc + 1)
    end
  end
end
