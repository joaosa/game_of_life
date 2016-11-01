defmodule GameOfLifeTest do
  use ExUnit.Case, async: true
  doctest GameOfLife

  describe "GameOfLife.get_player" do
    setup context do
      plays = File.read!("test/fixtures/play.txt")
      [
        player_w: plays,
        player_b: Regex.replace(~r/^.*\n/, plays, "b\n")
      ]
    end

    test "should read no player" do
      assert GameOfLife.get_player == nil
    end

    test "should read player w", context do
      assert GameOfLife.get_player(context[:player_w]) == :w
    end

    test "should read player b", context do
      assert GameOfLife.get_player(context[:player_b]) == :b
    end

    test "should not read a grid" do
      refute GameOfLife.get_grid
    end
  end
end
