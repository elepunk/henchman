defmodule Henchman.Randomizer do
  defmodule InvalidLengthError do
    defexception message: "Length cannot be lesser than 1"
  end

  @moduledoc """
  Random string generator module.
  """

  @doc """
  Generate random string that in multiple type. Default type is ```alphanumeric```.

  ## Supported Types
  * ```:alphanumeric``` - Random alphanumeric string
  * ```:numeric``` - Random numeric only string
  * ```:upper``` - Random non-numeric upper case string
  * ```:lower``` - Random non-numeric lower case string

  ## Example
      iex> Henchman.Randomizer.generate(20)
      iex> Henchman.Randomizer.generate(20, :numeric)
  """
  @spec generate(pos_integer(), atom()) :: String.t
  def generate(length, type \\ :alphanumeric) do
    alphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    numbers = "0123456789"

    lists =
      cond do
        type == :alpha -> alphabets <> String.downcase(alphabets)
        type == :numeric -> numbers
        type == :upper -> alphabets
        type == :lower -> String.downcase(alphabets)
        true -> alphabets <> String.downcase(alphabets) <> numbers
      end
      |> String.split("", trim: true)

    do_generate(length, lists)
  end
  
  @doc false
  defp do_generate(length, lists) do
    get_range(length)
    |> Enum.reduce([], fn(_, acc) -> [Enum.random(lists) | acc] end)
    |> Enum.join("")
  end

  @doc false
  defp get_range(length) when length > 1, do: (1..length)
  defp get_range(length) when length < 1, do: raise InvalidLengthError
  defp get_range(length), do: [1]
end
