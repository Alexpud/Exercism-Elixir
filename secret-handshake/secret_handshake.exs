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
    # doubleWink?([], 10)
    []
    |> wink?(code)
    |> doubleWink?(code)
    |> closeEyes?(code)
    |> jump?(code)
    |> reverse?(code)
  end

  def wink?(list, value) do
    case band(value, 1) do
      1 -> List.insert_at(list,0, "wink")
      _ -> list
    end
  end

  def doubleWink?(list, value) do
    case band(value, 2) do
      2 -> List.insert_at(list,0, "double blink")
      _ -> list
    end
  end

  def closeEyes?(list, value) do
    case band(value, 4) do
      4 -> List.insert_at(list,0, "close your eyes")
      _ -> list
    end
  end

  
  def jump?(list, value) do
    case band(value, 8) do
      8 -> List.insert_at(list,0, "jump")
      _    -> list
    end
  end

  def reverse?(list, value) do
    case band(value, 16) do
      16 -> list
      _ -> Enum.reverse(list)
    end
  end
  
end