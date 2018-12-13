defmodule Bob do
  def hey(input) do
    cond do
      yellingQuestion?(input) -> "Calm down, I know what I'm doing!"
      question?(input) && !yelling?(input)-> "Sure."
      yelling?(input) -> "Whoa, chill out!"
      String.trim(input) == "" -> "Fine. Be that way!"
      true -> "Whatever."
    end
  end

  def yelling?(input) do
    String.trim(input) != "" &&
    talkingForcefully?(input) &&
    !String.ends_with?(input, "?") &&
    not (hasNumbers?(input) && !hasLetters?(input))
  end

  def talkingForcefully?(input) do
    input == String.upcase(input)
  end

  def hasLetters?(input) do
    Regex.match?(~r/[A-Za-z]/, input)
  end

  def hasNumbers?(input) do
    Regex.match?(~r/[1-9]/, input)
  end

  def question?(input) do
    String.ends_with?(input, "?")
  end

  def yellingQuestion?(input) do
    question?(input) &&
    talkingForcefully?(input) &&
    hasLetters?(input)
  end

end
