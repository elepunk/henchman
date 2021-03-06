defmodule Henchman.String do
  @moduledoc """
  Additional string functionalities.
  """

  @doc """
  Get the acronym from a string.

  ## Example
      iex> Henchman.String.acronym("foo bar") //"FB"
  """
  def acronym(value) do
    value
    |> slug
    |> String.split("-")
    |> Enum.map_join("", &(String.first(title_case(&1))))
  end

  @doc """
  Convert string to camel case.

  ## Example
      iex> Henchman.String.camel_case("foo-bar")#fooBar
  """
  @spec camel_case(String.t) :: String.t
  def camel_case(value) do
    [head | tail] = String.split(value, ["-", "_"])
    head <> Enum.map_join(tail, "", &(String.capitalize(&1)))
  end

  @doc """
  Determine if string contains alphabets only.

  ## Example
      iex> Henchman.String.alpha?("ABCdef")#true
  """
  @spec alpha?(String.t) :: String.t
  def alpha?(value), do: String.match?(value, ~r/^[A-Za-z]*$/u)

  @doc """
  Determine if string contains alphabets and integers.

  ## Example
      iex> Henchman.String.alphanumeric?("ABCdef123")#true
  """
  @spec alphanumeric?(String.t) :: String.t
  def alphanumeric?(value), do: String.match?(value, ~r/^[A-Za-z0-9]*$/u)

  @doc """
  Determine if string is blank.

  ## Example
      iex> Henchman.String.blank?("")#true
  """
  @spec blank?(String.t) :: String.t
  def blank?(value), do: String.match?(value, ~r/^[\s]*$/u)

  @doc """
  Determine if string contains lower case characters only.

  ## Example
      iex> Henchman.String.lowercased?("def")#true
  """
  @spec lowercased?(String.t) :: String.t
  def lowercased?(value), do: String.match?(value, ~r/^[a-z]*$/u)

  @doc """
  Determine if string contains integers only.

  ## Example
      iex> Henchman.String.numeric?("123")#true
  """
  @spec numeric?(String.t) :: String.t
  def numeric?(value), do: String.match?(value, ~r/^[0-9]*$/u)

  @doc """
  Determine if string contains upper case characters only.

  ## Example
      iex> Henchman.String.uppercased?("ABC")#true
  """
  @spec uppercased?(String.t) :: String.t
  def uppercased?(value), do: String.match?(value, ~r/^[A-Z]*$/u)

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
  Convert string to slug format.

  ## Example
      iex>Henchman.String.slug("foo Bar")#foo-bar
  """
  @spec slug(String.t, String.t) :: String.t
  def slug(value, delimiter \\ "-") do
    value
    |> String.downcase
    |> String.replace(~r/[^\w-]+/u, delimiter)
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
