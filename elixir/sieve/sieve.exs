require IEx

defmodule Sieve do

  @doc """
  Generates a list of primes up to a given limit.
  """
  @spec primes_to(non_neg_integer) :: [non_neg_integer]
  def primes_to(limit) do
    range = 2..limit |> Enum.to_list

    mark(range, 2, List.last(range))
  end

  # mark (filter) every kth instance of n, but not n
  def mark(range, curr_prime, limit) when curr_prime >= limit, do: range
  def mark(range, curr_prime, limit) do
    curr_prime_idx = Enum.find_index range, &(&1 == curr_prime)

    updated_list = get_list(range)
      |> Enum.map fn { num, idx } ->
        cond do
          idx > curr_prime_idx and (idx != :marked && rem(idx, curr_prime) == 0) ->
            { num, :marked }
          true ->
            { num, idx }
        end
      end

    next_prime_tup = Enum.find(updated_list, fn { _num, idx } -> idx != :marked end)

    mark(updated_list, elem(next_prime_tup, 0), limit)
  end

  defp get_list(range) do
    cond do
      List.first(range) |> is_tuple ->
        range
      true ->
        Enum.with_index(range)
    end
  end
end
