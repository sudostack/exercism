require IEx

defmodule Roman do
  @doc """
  Convert the number to a roman number.

  APPROACH:
  800 => DCCC
  900 => CM vs DCCCC

  8 => VIII vs IIX
  9 => VIIII vs IX

  Figure out if the next denomination up, minus the current denom is equal to target (when remainder is zero)
  If so, take it, if not, then start w/ the current denom and build
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    deduction({ number, :thousands })
  end

  @denom_order ~w(thousands five_hunds centrums fifties tens fives)
  @denominations %{
    thousands:  { 1000, "M" },
    five_hunds: { 500, "D" },
    centrums:   { 100, "C" },
    fifties:    { 50, "L" },
    tens:       { 10, "X" },
    fives:      { 5, "V" },
    ones:       { 1, "I" }
  }

  def deduction({ count, denomination }, acc_str \\ "") when count / Map.get(@denominations, denomination) > 0 do
    { divisor, char } = Map.get(@denominations, denomination)
    times = (count / divisor) |> Float.floor |> round
    { count - (divisor * times), roman_concat(char, times) }
  end
  def deduction({ count, denomination }, acc_str) when count > 0 do

  end
  def deduction({ count, denomination }, acc_str), do: acc_str

  def next_denom(denom) when denom != :thousands do
    Enum.find_index(@denominations, denom) - 1
  end
  def next_denom(denom) when denom == :thousands, do: nil

  def roman_concat(char, multiplier, str \\ "") do
    Enum.reduce 1..multiplier, str, fn(_count, acc) ->
      acc <> char
    end
  end
end
