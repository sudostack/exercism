defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    cond do
      number < 4 ->
        Enum.reduce 1..number, "", fn num, acc -> acc <> "I" end
      number < 5 ->
        numerals(5 - number) <> "V"
      number == 5 ->
        "V"
      number > 5 and number < 10 ->
        "V" <> numerals(number - 5)
    end
  end
end
