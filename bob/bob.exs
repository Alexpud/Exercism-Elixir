defmodule Bob do
  def hey(input) do
    cond do
      String.trim(input) == "" -> "Fine. Be that way!"
      yelling_question?(input) -> "Calm down, I know what I'm doing!"
      question?(input) -> "Sure."
      yelling?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp yelling_question?(input) do
    question?(input) &&
    talking_forcefully?(input) &&
    has_letters?(input)
  end

  defp question?(input) do
    String.ends_with?(input, "?")
  end

  defp talking_forcefully?(input) do
    input == String.upcase(input)
  end

  defp has_letters?(input) do
    Regex.match?(~r/[[:alpha:]]/u, input)
  end

  defp yelling?(input) do
    talking_forcefully?(input) &&
    has_letters?(input)
  end

end
