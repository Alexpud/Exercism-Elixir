defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  values = [10000, 1000, 100, 10, 1]
  use Bitwise
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    []
    |> wink?(code)
    |> double_wink?(code)
    |> close_eyes?(code)
    |> jump?(code)
    |> reverse?(code)
  end

  defp wink?(list, value) do
    case band(value, 1) do
      1 -> List.insert_at(list,0, "wink")
      _ -> list
    end
  end

  defp double_wink?(list, value) do
    case band(value, 2) do
      2 -> List.insert_at(list,0, "double blink")
      _ -> list
    end
  end

  defp close_eyes?(list, value) do
    case band(value, 4) do
      4 -> List.insert_at(list,0, "close your eyes")
      _ -> list
    end
  end


  defp jump?(list, value) do
    case band(value, 8) do
      8 -> List.insert_at(list,0, "jump")
      _    -> list
    end
  end

  defp reverse?(list, value) do
    case band(value, 16) do
      16 -> list
      _ -> Enum.reverse(list)
    end
  end

end
