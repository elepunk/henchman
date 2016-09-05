# Henchman

[![Build Status](https://travis-ci.org/elepunk/henchman.svg?branch=master)](https://travis-ci.org/elepunk/henchman)
[![Hex Downloads](https://img.shields.io/hexpm/dt/henchman.svg)](https://hex.pm/packages/henchman)
[![Hex Version](https://img.shields.io/hexpm/v/henchman.svg)](https://hex.pm/packages/henchman)

A set of helpers for elixir.

## Installation

Add `henchman` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:henchman, "~> 0.2.0"}]
end
```

## Usage

Henchman provides a set helpers that will come in handy.

### Randomizer

Generate random string for a specific length. There are 4 types supported:
* ```:alphanumeric``` - Random alphanumeric string
* ```:numeric``` - Random numeric only string
* ```:upper``` - Random non-numeric only string
* ```:lower```- Random non-numeric only string

```elixir
iex> Henchman.Randomizer.generate(20) #generate alphanumeric string
iex> Henchman.Randomizer.generate(20, :numeric) #generate numeric only string
```

### String Helpers

##### acronym/1

Generate acronym from string.

```elixir
iex> Henchman.String.acronym("foo bar")#FB
```

##### camel_case/1

Convert string to ```camelCase```.

```elixir
iex> Henchman.String.camel_case("foo-bar")#fooBar
```

##### is_alpha?/1

Determine if string contains alphabets only.

```elixir
iex> Henchman.String.is_alpha?("fooBAR")#true
```

##### is_alphanumeric?/1

Determine if string contains alphabets and integers.

```elixir
iex> Henchman.String.is_alphanumeric?("123fooBAR")#true
```

##### is_blank?/1

Determine if string is blank.

```elixir
iex> Henchman.String.is_blank?("")#true
```

##### is_lowercase?/1

Determine if string contains lower case characters only.

```elixir
iex> Henchman.String.is_lowercase?("foo")#true
```

##### is_numeric?/1

Determine if string contains integers only.

```elixir
iex> Henchman.String.is_numeric?("123")#true
```

##### is_uppercase?/1

Determine if string contains upper case characters only.

```elixir
iex> Henchman.String.is_uppercase?("BAR")#true
```

##### slug/1 or slug/2

Convert string to slug format.

```elixir
iex> Henchman.String.slug("Foo bar")#foo-bar
iex> Henchman.String.slug("Foo bar", "_")#foo_bar
```

##### snake_case/1 or snake_case/2

Convert string to ```snake_case```.

```elixir
iex> Henchman.String.snake_case("FooBar")#foo_bar
iex> Henchman.String.snake_case("FooBar", "-")#foo-bar
```

##### studly_case/1

Convert string to ```StudlyCase```.

```elixir
iex> Henchman.String.studly_case("foo-bar")#FooBar
```

##### title_case/1

Capitalize every first letters in a string.

```elixir
iex> Henchman.String.title_case("foo bar-baz")#Foo Bar-baz
```

##### limit/2 or word_limit/2

The string module can either truncate characters or words within a string.

```elixir
iex> Henchman.String.limit("Foo bar baz baz", 10)#Foo bar ba....
iex> Henchman.String.word_limit("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", 7)#Lorem ipsum dolor sit amet, consectetur adipiscing...
```

## License

Released under the MIT license - see ```LICENSE``` for details.
