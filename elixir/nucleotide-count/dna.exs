defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  # the strand is entered as a "char list" (single quoted)
  def count(strand, nucleotide) do
    Enum.filter(strand, &(&1 === nucleotide)) |> Enum.count
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.nucleotide_counts('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec nucleotide_counts([char]) :: Dict.t
  def nucleotide_counts(strand) do
    Enum.reduce nucleotides(), %{}, fn (nuc, acc) ->
      Map.put(acc, nuc, count(strand, nuc))
    end
  end

  defp nucleotides, do: [?A, ?C, ?G, ?T]
end
