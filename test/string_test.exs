defmodule Henchman.StringTest do
  use ExUnit.Case

  alias Henchman.String, as: String

  test "get acronym from string" do
    assert "FB" = String.acronym("fòô bàř")
  end

  test "convert string to camel case" do
    assert "fooBarBaz" = String.camel_case("foo-bar_baz")
  end

  test "check if string is alphabets only" do
    assert String.alpha?("ABCdef")
  end

  test "check if string is alphanumeric" do
    assert String.alphanumeric?("123ABCdef")
  end

  test "check if string is blank" do
    assert String.blank?(" ")
  end

  test "check if string is lower case" do
    assert String.lowercased?("foobar")
  end

  test "check if string is numeric only" do
    assert String.numeric?("123")
  end

  test "check if string is upper case" do
    assert String.uppercased?("FOOBAR")
  end

  test "truncate characters in a string" do
    assert "Foo bar ba..." = String.limit("Foo bar baz baz", 10)
  end

  test "convert string to slug format" do
    assert "foo-bar" = String.slug("foo Bar")
  end

  test "convert string to snake case" do
    assert "foo_bar_baz" = String.snake_case("FooBarBaz")
  end

  test "convert string to snake case with different delimiter" do
    assert "foo-bar-baz" = String.snake_case("fooBarBaz", "-")
  end

  test "convert string to studly case" do
    assert "FooBarBaz" = String.studly_case("foo-bar_baz")
  end

  test "convert string to title case" do
    assert "Foo Bar Baz" = String.title_case("foo bar baz")
  end

  test "convert certain string to title case" do
    assert "Foo Bar-baz" = String.title_case("foo bar-baz")
  end

  test "truncate word in a string" do
    assert "Lorem ipsum dolor sit amet, consectetur adipiscing..." = String.word_limit("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", 7)
  end
end
