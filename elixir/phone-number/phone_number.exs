defmodule Phone do
  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("123-456-7890")
  "1234567890"

  iex> Phone.number("+1 (303) 555-1212")
  "3035551212"

  iex> Phone.number("867.5309")
  "0000000000"
  """
  @spec number(String.t) :: String.t
  def number(raw) do
    raw_list    = to_char_list(sanitize(raw))
    [head|tail] = raw_list

    cond do
      head == ?1 && length(raw_list) == 11 ->
        number_string(to_string(tail))
      length(raw_list) == 11 || length(raw_list) == 9 ->
        "0000000000"
      Regex.match?(~r/[a-zA-Z]/, raw) ->
        "0000000000"
      true ->
        number_string(raw)
    end
  end

  defp sanitize(raw) do
    String.replace(raw, ~r/[.]/, "")
  end

  defp number_string(raw) do
    Regex.scan(~r/\d+/, raw)
    |> List.flatten
    |> Enum.join
  end
  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("123-456-7890")
  "123"

  iex> Phone.area_code("+1 (303) 555-1212")
  "303"

  iex> Phone.area_code("867.5309")
  "000"
  """
  @spec area_code(String.t) :: String.t
  def area_code(raw) do
    cond do
      String.length(raw) == 11 ->
        String.slice(raw, 1..3)
      true ->
        String.slice(raw, 0..2)
    end
  end

  @doc """
  Pretty print a phone number

  Wraps the area code in parentheses and separates
  exchange and subscriber number with a dash.

  ## Examples

  iex> Phone.pretty("123-456-7890")
  "(123) 456-7890"

  iex> Phone.pretty("+1 (303) 555-1212")
  "(303) 555-1212"

  iex> Phone.pretty("867.5309")
  "(000) 000-0000"
  """
  @spec pretty(String.t) :: String.t
  def pretty(raw) do
    digits = number(raw)
    "(#{area_code(digits)}) #{String.slice(digits, 3..5)}-#{String.slice(digits, 6..9)}"
  end
end
