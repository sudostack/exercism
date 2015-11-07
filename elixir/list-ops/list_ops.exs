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

  end

  @spec append(list, list) :: list
  def append(a, b) do

  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do

  end
end
