defmodule GameOfLife do
  def get_player do
    nil
  end

  def get_player(plays) do
    [head|tail] = String.split plays, "\n"
    [player|rest] = String.split head, ""
    String.to_atom(player)
  end
end
