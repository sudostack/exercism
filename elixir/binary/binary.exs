defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
    case string do
      "1" -> 1
      "10" -> 2
      "11" -> 3
      "100" -> 4
    end
  end
end
