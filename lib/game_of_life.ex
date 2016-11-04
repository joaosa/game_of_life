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
    numbered_lines = lines |> Enum.with_index

    for {line,line_index} <- numbered_lines, into: %{} do
      cols = String.split line, "", trim: true
      numbered_cols = cols |> Enum.with_index

      grid_cols = for {col,col_index} <- numbered_cols, into: %{} do
        {col_index,col}
      end
      {line_index, grid_cols}
    end
  end
end
