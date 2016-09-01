# Henchman

[![Build Status](https://travis-ci.org/elepunk/henchman.svg?branch=master)](https://travis-ci.org/elepunk/henchman)

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

#### Randomizer

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
