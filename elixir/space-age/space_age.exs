defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.

  - Mercury: orbital period 0.2408467 Earth years
  - Venus: orbital period 0.61519726 Earth years
  - Mars: orbital period 1.8808158 Earth years
  - Jupiter: orbital period 11.862615 Earth years
  - Saturn: orbital period 29.447498 Earth years
  - Uranus: orbital period 84.016846 Earth years
  - Neptune: orbital period 164.79132 Earth years

  """
  @earth_day_seconds  86400
  @earth_days         365.25

  @planets %{
    :mercury => 0.2408467,
    :venus   => 0.61519726,
    :earth   => 1,
    :mars    => 1.8808158,
    :jupiter => 11.862615,
    :saturn  => 29.447498,
    :uranus  => 84.016846,
    :neptune => 164.79132,
  }

  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    earth_year_seconds = seconds / earth_year_in_seconds
    earth_year_seconds * Map.get(@planets, planet)
  end

  defp earth_year_in_seconds, do: @earth_days * @earth_day_seconds
end
