defmodule Henchman do
  @moduledoc false

  defmacro __using__(_) do
    quote do
      alias Henchman.Randomizer
      alias Henchman.String
      alias Henchman.Converter.Length
    end
  end
end
