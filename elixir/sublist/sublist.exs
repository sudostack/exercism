defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a == b -> :equal
      empty_list?(a) || empty_list?(b) -> :sublist
    end
  end

  defp empty_list?(list), do: Enum.count(list) == 0
end
