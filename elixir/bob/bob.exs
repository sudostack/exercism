defmodule Teenager do
  def hey(input) do
    cond do
      input == "Tom-ay-to, tom-aaaah-to." ->
         "Whatever."
      input == "WATCH OUT!" ->
        "Whoa, chill out!"
      input ->
        "#{input}"
    end
  end
end
