defmodule Henchman.StringTest do
  use ExUnit.Case

  alias Henchman.String, as: Str

  test "get acronym from string" do
    assert "FB" = Str.acronym("foo bar")
  end

  test "convert string to camel case" do
    assert "fooBarBaz" = Str.camel_case("foo-bar_baz")
  end

  test "truncate characters in a string" do
    assert "Foo bar ba..." = Str.limit("Foo bar baz baz", 10)
  end

  test "convert string to slug format" do
    assert "foo-bar" = Str.slug("foo Bar")
  end

  test "convert string to snake case" do
    assert "foo_bar_baz" = Str.snake_case("FooBarBaz")
  end

  test "convert string to snake case with different delimiter" do
    assert "foo-bar-baz" = Str.snake_case("fooBarBaz", "-")
  end

  test "convert string to studly case" do
    assert "FooBarBaz" = Str.studly_case("foo-bar_baz")
  end

  test "convert string to title case" do
    assert "Foo Bar Baz" = Str.title_case("foo bar baz")
  end

  test "convert certain string to title case" do
    assert "Foo Bar-baz" = Str.title_case("foo bar-baz")
  end

  test "truncate word in a string" do
    assert "Lorem ipsum dolor sit amet, consectetur adipiscing..." = Str.word_limit("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", 7)
  end
end
