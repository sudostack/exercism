defmodule Gigasecond do
	@doc """
	Calculate a date one billion seconds after an input date.
	"""
	@spec from({pos_integer, pos_integer, pos_integer}) :: :calendar.date
  @gigasecond :math.pow(10, 9) |> round

	def from({year, month, day}) do
    :calendar.datetime_to_gregorian_seconds({{year, month, day}, {0, 0, 0}}) + @gigasecond
    |> :calendar.gregorian_seconds_to_datetime
    |> elem(0)
	end
end
