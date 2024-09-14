defmodule CalculatorTest do
  use ExUnit.Case
  doctest Calculator

  describe "add/2" do
    test "when n1 integer and and n2 integer" do
      assert Calculator.add(1, 2) == {:ok, 3}
    end

    test "when n1 float and and n2 integer" do
      assert Calculator.add(1.1, 2) == {:ok, 3.1}
    end

    test "when n1 integer and n2 float" do
      assert Calculator.add(1, 2.1) == {:ok, 3.1}
    end

    test "when n1 integer and n2 negative float" do
      assert Calculator.add(1, -2.1) == {:ok, -1.1}
    end

    test "when n1 float and n2 float" do
      assert Calculator.add(1.1, 2.1) == {:ok, 3.2}
    end

    test "when n1 is not a number and n2 float" do
      assert Calculator.add(:number, 2.1) == {:error, "number and 2.1 must be a number"}
    end
  end

  describe "sub/2" do
    test "when n1 integer and and n2 integer" do
      assert Calculator.sub(1, 2) == {:ok, -1}
    end

    test "when n1 float and and n2 integer" do
      assert Calculator.sub(1.1, 2) == {:ok, -0.8999999999999999}
    end

    test "when n1 integer and n2 float" do
      assert Calculator.sub(1, 2.1) == {:ok, -1.1}
    end

    test "when n1 integer and n2 negative float" do
      assert Calculator.sub(1, -2.1) == {:ok, 3.1}
    end

    test "when n1 float and n2 float" do
      assert Calculator.sub(1.1, 2.1) == {:ok, -1.0}
    end

    test "when n1 is not a number and n2 float" do
      assert Calculator.sub(:number, 2.1) == {:error, "number and 2.1 must be a number"}
    end
  end

  describe "mult/2" do
    test "when n1 integer and and n2 integer" do
      assert Calculator.mult(1, 2) == {:ok, 2}
    end

    test "when n1 float and and n2 integer" do
      assert Calculator.mult(1.1, 2) == {:ok, 2.2}
    end

    test "when n1 integer and n2 float" do
      assert Calculator.mult(1, 2.1) == {:ok, 2.1}
    end

    test "when n1 integer and n2 negative float" do
      assert Calculator.mult(1, -2.1) == {:ok, -2.1}
    end

    test "when n1 float and n2 float" do
      assert Calculator.mult(1.1, 2.1) == {:ok, 2.3100000000000005}
    end

    test "when n1 is not a number and n2 float" do
      assert Calculator.mult(:number, 2.1) == {:error, "number and 2.1 must be a number"}
    end
  end

  describe "div/2" do
    test "when n1 integer and and n2 integer" do
      assert Calculator.div(6, 2) == {:ok, 3.0}
    end

    test "when n1 float and and n2 integer" do
      assert Calculator.div(6.0, 2) == {:ok, 3.0}
    end

    test "when n1 integer and n2 float" do
      assert Calculator.div(6, 1.5) == {:ok, 4.0}
    end

    test "when n1 integer and n2 negative float" do
      assert Calculator.div(6, -1.5) == {:ok, -4.0}
    end

    test "when n1 float and n2 float" do
      assert Calculator.div(6.0, 1.5) == {:ok, 4.0}
    end

    test "when n2 is 0" do
      assert Calculator.div(1, 0) == {:error, "Can't divide by zero"}
    end

    test "when n1 is not a number and n2 float" do
      assert Calculator.div(:number, 2.1) == {:error, "number and 2.1 must be a number"}
    end
  end
end
