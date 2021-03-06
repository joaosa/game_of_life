defmodule GameOfLifeTest do
  use ExUnit.Case, async: true
  doctest GameOfLife

  setup_all do
    plays = File.read!("test/fixtures/play.txt")
    [
      player_w: plays,
      player_b: Regex.replace(~r/^.*\n/, plays, "b\n")
    ]
  end

  describe "GameOfLife.get_player" do
    test "should read no player" do
      refute GameOfLife.get_player
    end

    test "should read player w", context do
      assert GameOfLife.get_player(context[:player_w]) == :w
    end

    test "should read player b", context do
      assert GameOfLife.get_player(context[:player_b]) == :b
    end
  end

  describe "GameOfLife.get_grid" do
    test "should not read a grid" do
      refute GameOfLife.get_grid
    end

    test "should read an empty grid" do
      assert is_map(GameOfLife.get_grid(""))
    end

    test "should read a grid", context do
      assert is_map(GameOfLife.get_grid(context[:player_w]))
    end

    test "should have the right height", context do
      grid = GameOfLife.get_grid(context[:player_w])
      grid_height = Map.size grid
      assert grid_height == 29
    end

    test "should have the right width", context do
      grid = GameOfLife.get_grid(context[:player_w])
      grid_width = grid
                   |> (&Enum.map(&1, fn({_,v}) -> Map.size v end)).()
                   |> (&Enum.sum(&1) / length(&1)).()
                   |> round
      assert grid_width == 29
    end
  end

  describe "GameOfLife.get_neighbors" do
    test "should not get any neighbors" do
      refute GameOfLife.get_neighbors
    end

    test "should read an empty set of neighbors" do
      assert is_list(GameOfLife.get_neighbors(""))
    end
  end
end
