defmodule Calculator do
  @moduledoc """
  Simple Calculator with add/2, sub/2, mult/2 and dev/2 functions
  """

  @doc """
  Add two numbers

  ## Examples
      iex> Calculator.add(2, 3)
      {:ok, 5}
  """
  @spec add(n1 :: number(), n2 :: number()) :: {:ok, number()} | {:error, String.t()}
  def add(n1, n2) when is_number(n1) and is_number(n2), do: {:ok, n1 + n2}
  def add(n1, n2), do: must_be_a_number_error(n1, n2)

  @doc """
  Subtracts second number from the first

  ## Examples
      iex> Calculator.sub(5, 2)
      {:ok, 3}
  """
  @spec sub(n1 :: number(), n2 :: number()) :: {:ok, number()} | {:error, String.t()}
  def sub(n1, n2) when is_number(n1) and is_number(n2), do: {:ok, n1 - n2}
  def sub(n1, n2), do: must_be_a_number_error(n1, n2)

  @doc """
  Multiplies two numbers

  ## Examples
      iex> Calculator.mult(2, 3)
      {:ok, 6}
  """
  @spec mult(n1 :: number(), n2 :: number()) :: {:ok, number()} | {:error, String.t()}
  def mult(n1, n2) when is_number(n1) and is_number(n2), do: {:ok, n1 * n2}
  def mult(n1, n2), do: must_be_a_number_error(n1, n2)

  @doc """
  Divides two numbers

  ## Examples
      iex> Calculator.div(6, 2)
      {:ok, 3.0}
  """
  @spec div(n1 :: number(), n2 :: number()) :: {:ok, number()} | {:error, String.t()}
  def div(_, n2) when n2 == 0, do: zero_devide_error()
  def div(n1, n2) when is_number(n1) and is_number(n2), do: {:ok, n1 / n2}
  def div(n1, n2), do: must_be_a_number_error(n1, n2)

  defp must_be_a_number_error(n1, n2), do: {:error, "#{n1} and #{n2} must be a number"}
  defp zero_devide_error(), do: {:error, "Can't divide by zero"}
end
