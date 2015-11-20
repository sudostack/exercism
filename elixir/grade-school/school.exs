defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(Dict.t, String.t, pos_integer) :: Dict.t
  def add(db, name, grade) do
    # Map.update(db, grade, [name], fn list -> [name|list] end)
    Map.update(db, grade, [name], &([name|&1]))
  end

  @doc """
  Return the names of the students in a particular grade.
  """
  @spec grade(Dict.t, pos_integer) :: [String]
  def grade(db, grade) do
    if Map.has_key?(db, grade) do
      Map.get(db, grade)
    else
      []
    end
  end

  @doc """
  Sorts the school by grade and name.
  """
  @spec sort(Dict) :: Dict.t
  def sort(db) do
    # Enum.reduce(Map.keys(db), %{}, &Map.put(&2, &1, Enum.sort(db[&1])))
    Enum.reduce(Map.keys(db), %{}, fn grade, acc ->
      Map.put(acc, grade, Enum.sort(db[grade]))
    end)
  end
end
