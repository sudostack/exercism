require IEx
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
      get_date(days_list(year, month), weekday, schedule)
    }
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

  def days_list(year, month) do
    for day <- 1..:calendar.last_day_of_the_month(year, month) do
      {day, Map.get(@weekdays, :calendar.day_of_the_week(year, month, day))}
    end
  end

  @schedule_idx %{
    :first  => 0,
    :second => 1,
    :third  => 2,
    :fourth => 3
  }

  defp get_date(days_of_the_month, day_of_the_week, schedule) do
    case schedule do
      :teenth ->
        days_of_the_month
        |> Enum.filter(fn {dotm, _} -> dotm >= 13 && dotm <= 19 end)
        |> Enum.find(fn {_, dotw} -> dotw == day_of_the_week end)
      :last ->
        days_of_the_month
        |> Enum.filter(fn {_, dotw} -> day_of_the_week == dotw end)
        |> List.last
      _ ->
        days_of_the_month
        |> Enum.filter(fn {_, dotw} -> day_of_the_week == dotw end)
        |> Enum.at(Map.get(@schedule_idx, schedule))
    end
    |> elem(0)
  end
end
