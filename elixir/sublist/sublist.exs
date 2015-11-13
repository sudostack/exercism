defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a == b                         -> :equal
      Enum.empty?(a)                 -> :sublist
      Enum.empty?(b)                 -> :superlist
      comparator(a, b) == :sublist   -> :sublist
      comparator(a, b) == :superlist -> :superlist
      true                           -> :unequal
    end
  end

  defp comparator(list1, list2) do
    list1_len = Enum.count(list1)
    list2_len = Enum.count(list2)
    list1_sum = Enum.sum(list1)
    list2_sum = Enum.sum(list2)

    cond do
      (list1_len == list2_len) && (list1_sum == list2_sum) && same_num_type?(list1_sum, list2_sum) ->
        :equal
      (list1_len == list2_len) && (list1_sum < list2_sum) && same_num_type?(list1_sum, list2_sum) ->
        :unequal
      (list1_len < list2_len) && (list1_sum < list2_sum) && same_num_type?(list1_sum, list2_sum) ->
        :sublist
      (list1_len > list2_len) && (list1_sum > list2_sum) && same_num_type?(list1_sum, list2_sum) ->
        :superlist
      true ->
        :unequal
    end
  end

  defp same_num_type?(num1, num2) do
    (is_float(num1) && is_float(num2)) || (!is_float(num1) && (!is_float(num2)))
  end
end
