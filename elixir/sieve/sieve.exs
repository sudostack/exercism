require IEx

defmodule Sieve do

  @doc """
  Generates a list of primes up to a given limit.
  """
  @spec primes_to(non_neg_integer) :: [non_neg_integer]
  def primes_to(limit) do
    list = 2..limit |> Enum.to_list |> Enum.map &({ &1, false })

    primes = mark(list, List.first(list), List.last(list) |> elem(0))
      |> Enum.filter fn { _, marking } -> marking == false end

    Enum.map primes, &elem(&1, 0)
  end

  # mark (filter) every kth instance of n, but not n
  def mark(num_list, { prime, _marked }, limit) when prime >= limit, do: num_list
  def mark(num_list, { prime, _marked }, limit) do
    prime_idx = prime_index(num_list, prime)

    num_list_with_index = Enum.with_index(num_list)
      |> Enum.map fn { {num, marked}, idx } ->
        cond do
          Enum.any?(indices_to_mark(num_list, prime), &(&1 == idx)) ->
            { {num, true}, idx }
          true ->
            { {num, marked}, idx }
        end
      end

    next_unmarked = Enum.find num_list_with_index, fn { {_num, marked}, idx } ->
      idx > prime_idx && marked == false
    end

    updated_list = Enum.map num_list_with_index, &(elem(&1, 0))

    cond do
      !next_unmarked ->
        mark(updated_list, { limit, false }, limit)
      true ->
        mark(updated_list, elem(next_unmarked, 0), limit)
    end
  end

  defp prime_index(list, prime) do
    Enum.find_index list, &(elem(&1, 0) == prime)
  end

  def indices_to_mark(list, prime) do
    limit = length(list) - 1
    p_idx = prime_index(list, prime)

    gen_idx(p_idx, prime, [], limit)
  end

  def gen_idx(start_idx, step_size, acc, limit) when (start_idx + step_size) > limit, do: acc
  def gen_idx(start_idx, step_size, acc, limit) do
    next_idx = start_idx + step_size
    gen_idx(next_idx, step_size, acc ++ [next_idx], limit)
  end
end
