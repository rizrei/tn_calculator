defmodule TnCalculatorTest do
  use ExUnit.Case
  doctest TnCalculator

  test "greets the world" do
    assert TnCalculator.hello() == :world
  end
end
