defmodule Henchman.String do
  @moduledoc """
  Additional string functionalities.
  """

  @doc """
  Convert string to camel case.

  ## Example
      iex>Henchman.String.camel_case(foo-bar)#fooBar
  """
  @spec camel_case(String.t) :: String.t
  def camel_case(value) do
    [head | tail] = String.split(value, ["-", "_"])
    head <> Enum.map_join(tail, "", &(String.capitalize(&1)))
  end

  @doc """
  Limit characters within a string.

  ## Example
      iex> Henchman.String.limit("Foo bar baz", 7)#Foo bar...
  """
  @spec limit(String.t, pos_integer(), String.t) :: String.t
  def limit(value, length \\ 100, suffix \\ "...") do
    value
    |> String.slice(0, length)
    |> String.pad_trailing(length+String.length(suffix), suffix)
  end

  @doc """
  Convert string to snake case.

  ## Example
      iex> Henchman.String.snake_case("FooBar")#foo_bar
  """
  @spec snake_case(String.t, String.t) :: String.t
  def snake_case(value, delimiter \\ "_") do
    value
    |> String.replace(~r/(.)(?=[A-Z])/u, "\\g{1}#{delimiter}")
    |> String.split(delimiter)
    |> Enum.map_join(delimiter, &(String.downcase(&1)))
  end

  @doc """
  Convert string to studly case.

  ## Example
      iex> Henchman.String.studly_case("foo-bar")#FooBar
  """
  @spec studly_case(String.t) :: String.t
  def studly_case(value) do
    value
    |> String.split(["-", "_"])
    |> Enum.map_join("", &(String.capitalize(&1)))
  end

  @doc """
  Capitalize the first letter in a string.

  ## Example
      iex> Henchman.String.title_case("Foo bar-baz")#Foo Bar-baz
  """
  @spec title_case(String.t) :: String.t
  def title_case(value) do
    value
    |> String.split(" ")
    |> Enum.map_join(" ", &(String.capitalize(&1)))
  end

  @doc """
  Limit words within a string.

  ## Example
      iex> Henchman.String.word_limit("Foo bar baz", 1)#Foo...
  """
  @spec word_limit(String.t, pos_integer(), String.t) :: String.t
  def word_limit(value, limit \\ 100, suffix \\ "...") do
    {_, regex}= Regex.compile("^\\s*+(?:\\S++\\s*+){1,#{limit}}", "u")
    prefix =
      Regex.scan(regex, value)
      |> List.flatten
      |> List.to_string
      |> String.trim
    prefix <> suffix
  end
end
