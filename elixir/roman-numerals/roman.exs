defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number), do: deduce(number, "")

  @denominations [
    { 1000, "M" },
    {  900, "CM" },
    {  500, "D" },
    {  400, "CD" },
    {  100, "C" },
    {   90, "XC" },
    {   50, "L" },
    {   40, "XL" },
    {   10, "X" },
    {    9, "IX" },
    {    5, "V" },
    {    4, "IV" },
    {    1, "I" }
  ]

  defp largest_denom(count) do
    @denominations
    |> Enum.find fn { num, _char } ->
      num <= count
    end
  end

  defp deduce(0, char_accum), do: char_accum
  defp deduce(count, char_accum) do
    { num, char } = largest_denom(count)
    deduce(count - num, char_accum <> char)
  end
end
