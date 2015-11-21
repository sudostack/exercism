defmodule Year do
  @doc """
  Returns whether 'year' is a leap year.

  A leap year occurs:

  on every year that is evenly divisible by 4
    except every year that is evenly divisible by 100
      except every year that is evenly divisible by 400.
  """
  @spec leap_year?(non_neg_integer) :: boolean
  def leap_year?(year) do
    cond do
      div_four?(year) && !div_hundred?(year) && !div_four_hun?(year) ->
        true
      div_four?(year) && div_hundred?(year) && div_four_hun?(year)  ->
        true
      true ->
        false
    end
  end

  defp div_four?(year), do: rem(year, 4) == 0

  defp div_hundred?(year), do: rem(year, 100) == 0

  def div_four_hun?(year), do: rem(year, 400) == 0
end
