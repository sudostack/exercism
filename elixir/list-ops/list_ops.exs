defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l), do: counter(l)

  defp counter([]), do: 0
  defp counter([_|tail]), do: counter(tail) + 1

  @spec reverse(list) :: list
  def reverse(l) do
    rtl(l)
  end

  defp rtl(list, accum \\ [])
  defp rtl([head|tail], accum), do: rtl(tail, [head|accum])
  defp rtl([], accum), do: accum

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    mapper(l, f)
  end

  defp mapper([], _func), do: []
  defp mapper([head|tail], func), do: [ func.(head) | mapper(tail, func) ]

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    filtration(l, f)
  end

  defp filtration([], _func), do: []
  defp filtration([head|tail], func) do
    case func.(head) do
      true  -> [ head | filtration(tail, func) ]
      false -> filtration(tail, func)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do
    foldl(l, acc, f)
  end

  defp foldl([head|tail], accum, func), do: foldl(tail, func.(head, accum), func)
  defp foldl([], accum, _func), do: accum

  @spec append(list, list) :: list
  def append(a, b), do: pusher(a, b)

  defp pusher(a, b) do
    cond do
      count(a) == 0 -> push_left(a, b)
      count(b) == 0 -> push_right(a, b)
      true          -> push_left(reverse(a), b)
    end
  end
  defp push_left([head|tail], accum), do: push_left(tail, [head|accum])
  defp push_left([], accum), do: accum
  defp push_right(accum, [head|tail]), do: push_right([head|accum], tail)
  defp push_right(accum, []), do: accum

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    joiner(ll)
  end

  defp joiner(list, accum \\ [])
  defp joiner([ [head|tail] | t ], accum), do: joiner([ tail | t], [head|accum])
  defp joiner([[]|tail], accum), do: joiner(tail, accum)
  defp joiner([], accum), do: reverse(accum)
end
