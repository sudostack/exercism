defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    { number, 0 }
    |> thousands
    |> five_hunds
    |> centrums
    |> fifties
    |> tens
    |> fives
    |> ones
    |> elem(1)

    defp roman_concat(char, multiplier, str \\ "") do
      Enum.reduce 1..multiplier, str, fn(char, acc) ->
        acc <> char
      end
    end

    defp remainder(num_tup, divisor) do
      rem(elem(num_tup, 0), divisor)
    end

    defp thousands(num_tup) do
      { remainder(num_tup, 1000), roman_concat("M", elem(num_tup, 0)/1000) }
    end

    defp five_hunds(num_tup) do
      { remainder(num_tup, 500), roman_concat("D", elem(num_tup, 0)/500) }
    end

    defp centrums(num_tup) do
      { remainder(num_tup, 100), roman_concat("C", elem(num_tup, 0)/100) }
    end

    defp fifties(num_tup) do
      { remainder(num_tup, 50), roman_concat("L", elem(num_tup, 0)/50) }
    end

    defp tens(num_tup) do
      { remainder(num_tup, 10), roman_concat("L", elem(num_tup, 0)/10) }
    end

    defp fives(num_tup) do
      { remainder(num_tup, 5), roman_concat("V", elem(num_tup, 0)/5) }
    end

    defp ones(num_tup) do
      { 0, roman_concat("I", elem(num_tup, 0)/1) }
    end
    # cond do
    #   number < 4 ->
    #     Enum.reduce 1..number, "", fn num, acc -> acc <> "I" end
    #   number < 5 ->
    #     numerals(5 - number) <> "V"
    #   number == 5 ->
    #     "V"
    #   number > 5 and number < 10 ->
    #     "V" <> numerals(number - 5)
    # end
  end
end
