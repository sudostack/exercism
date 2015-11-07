defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l), do: sum(l)

  defp sum(list, accum \\ 0) # this is a func head w/ no body (avoids confusion when using defaults)
  defp sum([_|tail], accum), do: sum(tail, accum + 1)
  defp sum([], accum), do: accum

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
    filt(reverse(l), f)
  end

  defp filt(list, func, accum \\ [])
  defp filt([head|tail], func, accum) do
    cond do
      func.(head) -> filt(tail, func, [head|accum])
      true        -> filt(tail, func, accum)
    end
  end
  defp filt([], _func, accum), do: accum

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do
    foldl(l, acc, f)
  end

  defp foldl(list, accum \\ [], func)
  defp foldl([head|tail], accum, func), do: foldl(tail, func.(head, accum), func)
  defp foldl([], accum, _func), do: accum

  @spec append(list, list) :: list
  def append(a, b), do: pusher(a, b)

  defp pusher(a, b) do
    cond do
      count(a) == 0 -> push_left(a, b)
      count(b) == 0 -> push_right(a, b)
      count(a) > 1  -> push_left(reverse(a), b)
    end
  end
  defp push_left([head|tail], accum), do: push_left(tail, [head|accum])
  defp push_left([], accum), do: accum
  defp push_right(accum, [head|tail]), do: push_right([head|accum], tail)
  defp push_right(accum, []), do: accum

  @spec concat([[any]]) :: [any]
  def concat(ll) do

  end
end
