defmodule PigLatin do
  @pig_latin_accent "ay"
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    case is_voguel(String.at(phrase, 0)) do
      true -> translate_word_starting_with_voguel(phrase)
      false -> translate_word_starting_with_consonant(phrase) 
    end 
  end

  defp is_voguel(letter) do
    String.contains?("aeiouAEIOU", letter)
  end

  defp translate_word_starting_with_voguel(word) do
    "#{word}#{@pig_latin_accent}"
  end

  defp translate_word_starting_with_consonant(word) do
    Regex.scan(~r/\b[^aeiou]+[qu]?/i, word)
    |> Enum.flat_map(&(&1))
    |> Enum.at(0)
    |> mount_word_start_with_consonant(word)
  end
  
  defp mount_word_start_with_consonant(slicedPart, word) do
    "#{String.slice(word, String.length(slicedPart), String.length(word))}#{slicedPart}#{@pig_latin_accent}"
  end
end
