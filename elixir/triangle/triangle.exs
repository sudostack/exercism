defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: { :ok, kind } | { :error, String.t }
  def kind(a, b, c) do
    case [a, b, c] |> Enum.sort do
      [a, _, _] when a <= 0     -> {:error, "all side lengths must be positive"}
      [a, b, c] when c >= a + b -> {:error, "side lengths violate triangle inequality"}
      [a, a, a]                 -> {:ok, :equilateral}
      [a, a, _]                 -> {:ok, :isosceles}
      [_, b, b]                 -> {:ok, :isosceles}
      [_, _, _]                 -> {:ok, :scalene}
    end
  end
end
