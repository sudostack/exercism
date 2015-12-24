defmodule Sieve do

  @doc """
  Generates a list of primes up to a given limit.
  """
  @spec primes_to(non_neg_integer) :: [non_neg_integer]
  def primes_to(limit) do

  end

  def filler(limit, prime, sieves) when prime == limit, do: sieves
  def filler(limit, prime \\ 2, sieves \\ []) do
    primes = sieves ++ multiples(prime, limit) |> enum.sort

    filler(
      limit,
      next_unmarked(primes, prime),
      primes
    )
  end

  def multiples(_prime, _limit, i \\ 1, acc \\ [])
  def multiples(prime, limit, i, acc) when prime * i >= limit, do: acc
  def multiples(prime, limit, i, acc) do
    multiple = prime * i
    multiples(prime, limit, i + 1, acc ++ [multiple])
  end

  def next_unmarked(list, current_prime) do
    idx        = Enum.find_index fn n -> n == current_prime end
    next_prime = Enum.at(list, idx + 1)
  end
end
