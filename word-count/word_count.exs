defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    String.normalize(sentence, :nfd)
    |> remove_punctuation
    |> String.downcase
    |> split_string_separators
    |> group_words_array_by_word
    |> count_grouped_words_ocurrence
    |> Map.new
  end

  defp remove_punctuation(phrase) do
    String.replace(phrase, ~r/(?!-|_)[[:punct:]]*[:]*/, "")
  end

  defp split_string_separators(phrase) do
    String.split(phrase, ~r/[ |_]/, trim: true)
  end

  defp group_words_array_by_word(words_array) do
    Enum.group_by(words_array, fn x -> x end)
  end

  defp count_grouped_words_ocurrence(grouped_word_array) do
    for {word, ocurrences} <- grouped_word_array do
      {word, Enum.count(ocurrences)}
    end
  end
end
