defmodule GameOfLifeTest do
  use ExUnit.Case, async: true
  doctest GameOfLife

  describe "GameOfLife.get_player" do
    test "should read no player if no plays" do
      assert GameOfLife.get_player == nil
    end

    test "should read a player if there are plays", context do
      assert GameOfLife.get_player(context[:plays]) == :w
    end
  end
end
