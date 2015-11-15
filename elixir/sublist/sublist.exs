defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a === b        -> :equal
      a === []       -> :sublist
      b === []       -> :superlist
      sublist?(a, b) -> :sublist
      sublist?(b, a) -> :superlist
      true           -> :unequal
    end
  end

  defp sublist?(list1, list2) do
    list2
      |> Enum.chunk(length(list1), 1)
      |> Enum.any?(fn list -> list === list1 end)
  end
end
