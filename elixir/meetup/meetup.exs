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
    {
      year,
      month,
      day_from_schedule(month_week_dates(year, month), weekday, schedule)
    }
  end

  def month_week_dates(year, month) do
    for day <- 1..:calendar.last_day_of_the_month(year, month) do
      {day, :calendar.day_of_the_week(year, month, day)}
    end
  end

  @weekdays %{
    1 => :monday,
    2 => :tuesday,
    3 => :wednesday,
    4 => :thursday,
    5 => :friday,
    6 => :saturday,
    7 => :sunday,
  }

  def day_from_schedule(days_of_the_month, day_of_the_week, schedule) do
    { day, _ } = case schedule do
      :teenth ->
        days_of_the_month
        |> Enum.filter(fn {dotm, _} -> dotm >= 12 && dotm <= 19 end)
        |> Enum.find(fn {_, dotw} -> day_of_the_week == Map.get(@weekdays, dotw) end)
    end

    day
  end
end
