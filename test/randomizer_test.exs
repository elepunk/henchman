defmodule Henchman.RandomizerTest do
  use ExUnit.Case

  alias Henchman.Randomizer

  test "generate random alphanumeric string" do
    string = Randomizer.generate(30)
    assert 30 == String.length(string)
  end

  test "generate random non-alphanumeric string" do
    string = Randomizer.generate(30, :numeric)
    assert 30 == String.length(string)
    refute String.match?(string, ~r/[A-Za-z]/)
  end

  test "generate random non-numeric string" do
    string = Randomizer.generate(30, :alpha)
    assert 30 == String.length(string)
    refute String.match?(string, ~r/[0-9]/)
  end

  test "generate random upper case non-numeric string" do
    string = Randomizer.generate(30, :upper)
    assert 30 == String.length(string)
    refute String.match?(string, ~r/[a-z0-9]/)
  end

  test "generate random lower case non-numeric string" do
    string = Randomizer.generate(30, :lower)
    assert 30 == String.length(string)
    refute String.match?(string, ~r/[A-Z0-9]/)
  end

  test "raise exception when length is less than 1" do
    assert_raise Randomizer.InvalidLengthError, "Length cannot be lesser than 1", fn -> Randomizer.generate(0) end
  end
end
