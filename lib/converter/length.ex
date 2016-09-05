defmodule Henchman.Converter.Length do
  @behaviour Henchman.Converter

  alias Henchman.Converter.ConversionUnitError

  @doc """
  Length unit conversion.

  ## Supported unit
  * ```:millimetre```
  * ```:centimetre```
  * ```:metre```
  * ```:kilometre```
  * ```:inch```
  * ```:foot```
  * ```:mile```

  ## Example
      iex> Henchman.Converter.Length(1, :metre, :kilometre)#0.001
      iex> Henchman.Converter.Length(1, :metre, :centimetre, true)#100.0 cm
  """
  def convert(value, from, to, show_unit \\ false, precision \\ 4) do
    [from_rate, _] = get_conversion_rate(from)
    [to_rate, to_unit] = get_conversion_rate(to)

    converted_value =
      (value/from_rate)/to_rate
      |> Float.round(precision)

    if show_unit, do: Float.to_string(converted_value) <> " " <> to_unit, else: converted_value
  end

  defp get_conversion_rate(unit) when unit == :millimetre, do: [0.001, "mm"]
  defp get_conversion_rate(unit) when unit == :centimetre, do: [0.01, "cm"]
  defp get_conversion_rate(unit) when unit == :metre, do: [1, "m"]
  defp get_conversion_rate(unit) when unit == :kilometre, do: [1000, "km"]
  defp get_conversion_rate(unit) when unit == :inch, do: [0.0254, "in"]
  defp get_conversion_rate(unit) when unit == :foot, do: [0.3048, "ft"]
  defp get_conversion_rate(unit) when unit == :yard, do: [0.9144, "yd"]
  defp get_conversion_rate(unit) when unit == :mile, do: [1609.34, "mi"]
  defp get_conversion_rate(unit), do: raise ConversionUnitError, "Unit #{unit} is not available"
end
