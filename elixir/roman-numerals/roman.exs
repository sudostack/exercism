defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    cond do
      number < 5 ->
        Enum.reduce 1..number, "", fn num, acc -> acc <> "I" end
    end
  end
end
