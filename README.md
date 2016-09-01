# Henchman

[![Build Status](https://travis-ci.org/elepunk/henchman.svg?branch=master)](https://travis-ci.org/elepunk/henchman)
[![Hex Downloads](https://img.shields.io/hexpm/dt/henchman.svg)](https://hex.pm/packages/henchman)
[![Hex Version](https://img.shields.io/hexpm/v/henchman.svg)](https://hex.pm/packages/henchman)

A set of helpers for elixir.

## Installation

Add `henchman` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:henchman, "~> 0.1.0"}]
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

##### Example
```elixir
iex> Henchman.Randomizer.generate(20) #generate alphanumeric string
iex> Henchman.Randomizer.generate(20, :numeric) #generate numeric only string
```

### String Helpers

#### Acronym

Generate acronym from string.

##### Example
```elixir
iex> Henchman.String.acronym("foo bar")#FB
```

#### Camel case

Convert string to ```camelCase```.

##### Example
```elixir
iex> Henchman.String.camel_case("foo-bar")#fooBar
```

#### Slug

Convert string to slug format.

##### Example
```elixir
iex> Henchman.String.slug("Foo bar")#foo-bar
```

#### Snake case

Convert string to ```snake_case```.

##### Example
```elixir
iex> Henchman.String.snake_case("FooBar")#foo_bar
```

#### Studly case

Convert string to ```StudlyCase```.

##### Example
```elixir
iex> Henchman.String.studly_case("foo-bar")#FooBar
```

#### Title case

Capitalize every first letters in a string.

##### Example
```elixir
iex> Henchman.String.title_case("foo bar-baz")#Foo Bar-baz
```

#### Truncate

The string module can either truncate characters or words within a string.

##### Example
```elixir
iex> Henchman.String.limit("Foo bar baz baz", 10)#Foo bar ba....
iex> Henchman.String.word_limit("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", 7)#Lorem ipsum dolor sit amet, consectetur adipiscing...
```
