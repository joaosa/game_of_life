defmodule GameOfLifeTest do
  use ExUnit.Case, async: true
  doctest GameOfLife

  describe "GameOfLife.get_player" do
    test "should read no player if no plays" do
      assert GameOfLife.get_player == nil
    end
  end
end
