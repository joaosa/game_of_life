defmodule GameOfLife do
  def get_player do
    nil
  end
  def get_player(plays) do
    [head|_] = String.split plays, "\n"
    [player|_] = String.split head, ""
    String.to_atom(player)
  end

  def get_grid do
    nil
  end
end
