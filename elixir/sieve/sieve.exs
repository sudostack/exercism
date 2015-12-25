require IEx

defmodule Sieve do

  @doc """
  Generates a list of primes up to a given limit.
  """
  @spec primes_to(non_neg_integer) :: [non_neg_integer]
  def primes_to(limit) do
    range = 2..limit |> Enum.to_list

    range |> mark(2, List.last(range))
  end

  # mark (filter) every kth instance of n, but not n
  def mark(range, curr_prime, limit) when curr_prime >= limit, do: range
  def mark(range, curr_prime, limit) do
    curr_prime_idx = Enum.find_index(range, &(&1 == curr_prime))

    new_range = Enum.with_index(range)
      |> Enum.filter_map(
        fn { _num, idx } ->
          idx <= curr_prime_idx || (rem(idx + 1, curr_prime) == 0)
        end,
        &(elem(&1, 0))
      )

    mark(new_range, Enum.at(new_range, curr_prime_idx + 1), limit)
  end
end
