defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest.
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(number) do
    deduce(number)
  end

  def deduce(_number, divisor \\ 2, factors \\ [])
  def deduce(1, _divisor, factors) do
    factors
  end
  def deduce(number, divisor, factors) when rem(number, divisor) == 0 do
    # passing a float introduces infinite loop; use `div` instead
    deduce(div(number, divisor), divisor, factors ++ [divisor])
  end
  def deduce(number, divisor, factors) do
    deduce(number, divisor + 1, factors)
  end
end
