defmodule Henchman.Converter do
  defmodule ConversionUnitError do
    defexception message: "Unit is not available"
  end

  @moduledoc false

  @callback convert(non_neg_integer() | float(), atom(), atom(), boolean(), non_neg_integer()) :: float() | non_neg_integer()

  defmacro __using__(_) do
    quote do
      alias Henchman.Converter.Length
    end
  end
end
