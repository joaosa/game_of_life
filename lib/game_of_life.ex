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
  def get_grid(plays) do
    [_|lines] = String.split plays, "\n", trim: true
    grid_lines = lines |> Enum.with_index
    for {line,index} <- grid_lines, into: %{} do
      key = index
      val = String.split line, ""
      {key, val}
    end
  end
end
