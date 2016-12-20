defmodule Henchman do
  defdelegate alpha?(string), to: Henchman.String
  defdelegate alphanumeric?(string), to: Henchman.String
  defdelegate blank?(string), to: Henchman.String
  defdelegate lowercased?(string), to: Henchman.String
  defdelegate uppercased?(string), to: Henchman.String
  defdelegate numeric?(string), to: Henchman.String
  defdelegate limit(string, length \\ 100, suffix \\ "..."), to: Henchman.String
  defdelegate slug(string, delimeter \\ "-"), to: Henchman.String
  defdelegate snake_case(string, delimeter \\ "_"), to: Henchman.String
  defdelegate studly_case(string), to: Henchman.String
  defdelegate title_case(string), to: Henchman.String
  defdelegate camel_case(string), to: Henchman.String
  defdelegate acronym(string), to: Henchman.String
  defdelegate word_limit(string, limit \\ 100, suffix \\ "..."), to: Henchman.String
  defdelegate randomize(length, type \\ :alphanumeric), to: Henchman.Randomizer, as: :generate
  defdelegate convert_length(value, from, to, show_unit \\ false, precision \\ 4), to: Henchman.Converter.Length, as: :convert
end
