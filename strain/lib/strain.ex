defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep([head|tail], fun) do
    (if apply(fun, [head]) == true, do: [head], else: []) ++ keep(tail, fun)
  end

  def keep([], fun) do
    []
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard([head|tail], fun) do
    (if apply(fun, [head]) == false, do: [head], else: []) ++ discard(tail, fun)
  end

  def discard([], fun) do
    []
  end
end
