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

  defp same_length?(list1, list2) do
    Enum.count(l1) == Enum.count(l2)
  end

  defp linear_comp(list1, list2) do
    sorted_l1 = Enum.sort(list1)
    sorted_l2 = Enum.sort(list2)

    Enum.each(sorted_l1, fn num ->
      Enum.find_index(sorted_l2)
    end)
    # cond do
    #   Enum.sort(list1) == Enum.sort(list2) -> :equal
    # end
  end

  # I want to start comparing the values in each list
  # considerations: Enum.zip/2, list comprehensions
end
