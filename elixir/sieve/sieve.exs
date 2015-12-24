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
    new_range = Enum.with_index(range)
    |> Enum.filter_map(
      fn { num, idx } ->
        (curr_prime != num) && (rem(idx + 1, curr_prime) == 0)
      end,
      &(elem(&1, 0))
    )

    # next_prime_idx = (new_range |> Enum.find_index(curr_prime)) + 1

    # mark(new_range, new_range |> List.at(next_prime_idx), limit)
  end
end
