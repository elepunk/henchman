defmodule Henchman.Converter.LengthTest do
  use ExUnit.Case

  alias Henchman.Converter.Length
  alias Henchman.Converter.ConversionUnitError

  test "convert 1 metre to millimetre" do
    assert 1000.0 == Length.convert(1, :metre, :millimetre)
  end

  test "convert 1 metre to centimetre and show unit" do
    assert "100.0 cm" = Length.convert(1, :metre, :centimetre, true)
  end

  test "convert 1 metre to kilometre" do
    assert 0.001 == Length.convert(1, :metre, :kilometre)
  end

  test "convert 1 metre to inch" do
    assert 39.3701 = Length.convert(1, :metre, :inch)
  end

  test "convert 1 metre to foot" do
    assert 3.2808 = Length.convert(1, :metre, :foot)
  end

  test "convert 1 metre to mile" do
    assert 0.0006 = Length.convert(1, :metre, :mile)
  end

  test "raise exception if unit not found" do
    assert_raise ConversionUnitError, "Unit foobar is not available", fn -> Length.convert(1, :metre, :foobar) end
  end
end
