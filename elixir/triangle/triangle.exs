defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: { :ok, kind } | { :error, String.t }
  def kind(a, a, a), do: {:ok, :equilateral}
  def kind(a, a, _), do: {:ok, :isosceles}
  def kind(_, a, a), do: {:ok, :isosceles}
  def kind(a, _, a), do: {:ok, :isosceles}

  # def equilateral?(a, a, a), do: true
end
