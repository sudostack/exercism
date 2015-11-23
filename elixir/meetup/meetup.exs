defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """

  @type weekday ::
      :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, schedule) do
    # {2013, 5, 13}
    # go through each calendar day until :calendar.last_day_of_the_month(year, month)
      # check if weekday(day_of_the_week/3) matches `weekday`
      # check if
  end

  # defp cal_matrix(year, month) do
  #   matrix = [
  #     [], # week 1
  #     [],
  #     [],
  #     [],
  #     []
  #   ]

  #   first_dotw = :calendar.day_of_the_week({year, month, 1}) - 1
  #   last_dotm  = :calendar.last_day_of_the_month(year, month)

  #   Enum.each 1..last_dotm, fn day do
  #     cond do
  #       day == 1 ->
  #       true     ->
  #     end
  #   end
  # end

  defp weekday(day) do
    %{
      :monday    => 1,
      :tuesday   => 2,
      :wednesday => 3,
      :thursday  => 4,
      :friday    => 5,
      :saturday  => 6,
      :sunday    => 7
    }
    |> Map.get(day)
  end
end
