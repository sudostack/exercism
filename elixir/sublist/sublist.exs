defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a == b         -> :equal
      empty_list?(a) -> :sublist
      empty_list?(b) -> :superlist
      true           -> :unequal
    end
  end

  defp empty_list?(list), do: Enum.count(list) == 0

  defp same_length?(l1, l2) do
    Enum.count(l1) == Enum.count(l2)
  end

  # I want to start comparing the values in each list
  # considerations: Enum.zip/2, list comprehensions
end
