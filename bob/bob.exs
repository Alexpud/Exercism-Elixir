defmodule Bob do
  def hey(input) do
    cond do
      yelling_question?(input) -> "Calm down, I know what I'm doing!"
      question?(input) && !yelling?(input)-> "Sure."
      yelling?(input) -> "Whoa, chill out!"
      String.trim(input) == "" -> "Fine. Be that way!"
      true -> "Whatever."
    end
  end

  defp yelling?(input) do
    String.trim(input) != "" &&
    talking_forcefully?(input) &&
    !String.ends_with?(input, "?") &&
    not (has_numbers?(input) && !has_letters?(input))
  end

  defp talking_forcefully?(input) do
    input == String.upcase(input)
  end

  defp has_letters?(input) do
    Regex.match?(~r/[A-Za-z]/, input)
  end

  defp has_numbers?(input) do
    Regex.match?(~r/[1-9]/, input)
  end

  defp question?(input) do
    String.ends_with?(input, "?")
  end

  defp yelling_question?(input) do
    question?(input) &&
    talking_forcefully?(input) &&
    has_letters?(input)
  end

end
