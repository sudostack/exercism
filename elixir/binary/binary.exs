defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
    cond do
      Regex.scan(~r/[01]/, string) |> length == String.length(string) ->
        convert(string)
      true ->
        0
    end
  end

  defp convert(bin_string) do
    num_list = bin_string |> String.split("", trim: true)

    Enum.zip(num_list, (length(num_list) - 1)..0)
    |> Enum.reduce 0, fn { multiplier, pow }, sum ->
      sum + (String.to_integer(multiplier) * :math.pow(2, pow))
    end
  end
end
