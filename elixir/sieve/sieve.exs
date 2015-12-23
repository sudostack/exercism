defmodule Sieve do

  @doc """
  Generates a list of primes up to a given limit.
  """
  @spec primes_to(non_neg_integer) :: [non_neg_integer]
  def primes_to(limit) do

  end

  def filler(limit, prime \\ 2, sieves \\ []) do
    Enum.reduce prime..limit, sieves, fn n, acc ->
    end
    # fill w/ multiples
    # take next unmarked and pass back to filler
  end

  def multiples(n, i, limit, acc \\ []) do
    multiple = n * i

    cond do
      n >= limit ->
        acc
      true       ->
        multiples(n, multiple, limit, acc ++ [multiple])
    end
  end

  def next_prime(n) do
  end
end
