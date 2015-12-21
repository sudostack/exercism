defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
    string
    |> String.split("", trim: true)
    |> to_int
  end

  defp to_int(num_list) do
    Enum.zip(num_list, (length(num_list) - 1)..0)
    |> Enum.reduce 0, fn { multiplier, pow }, sum ->
      sum + (String.to_integer(multiplier) * :math.pow(2, pow))
    end
  end
end
