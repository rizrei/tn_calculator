defmodule Calculator.ParserTest do
  use ExUnit.Case
  doctest Calculator.Parser

  import Calculator.Parser, only: [parse: 1]

  describe "parse/1" do
    test "when integer" do
      assert parse(3) == {:ok, 3}
    end

    test "when float number with zero mantissa" do
      assert parse(3.0) == {:ok, 3}
    end

    test "when string float number with zero mantissa" do
      assert parse("3.0") == {:ok, 3}
    end

    test "when atom" do
      assert parse(:atom) == {:error, "Invalid argument! :atom must be a number"}
    end

    test "when tuple" do
      assert parse({1, 2}) == {:error, "Invalid argument! {1, 2} must be a number"}
    end

    test "when list with invalid elements" do
      assert parse([:one, 2]) == {:error, "Invalid argument! [:one, 2] must be a number"}
    end

    test "when map" do
      assert parse(%{foo: "bar"}) ==
               {:error, "Invalid argument! %{foo: \"bar\"} must be a number"}
    end
  end
end
