defmodule Calculator do
  alias Calculator.Parser

  @moduledoc """
  Simple Calculator with `add/2`, `sub/2`, `mult/2` and `dev/2` functions
  """

  @doc """
  Add two numbers

  ## Examples
      iex> Calculator.add(2, 3)
      {:ok, 5}
  """
  @spec add(n1 :: number() | String.t(), n2 :: number() | String.t()) ::
          number() | {:error, String.t()}
  def add(n1, n2) do
    with(
      {:ok, normalized_n1} <- Parser.parse(n1),
      {:ok, normalized_n2} <- Parser.parse(n2),
      {:ok, result} <- Parser.parse(normalized_n1 + normalized_n2)
    ) do
      {:ok, result}
    else
      {:error, message} -> {:error, message}
    end
  end

  @doc """
  Subtracts second number from the first

  ## Examples
      iex> Calculator.sub(5, 2)
      {:ok, 3}
  """
  @spec sub(n1 :: number() | String.t(), n2 :: number() | String.t()) ::
          number() | {:error, String.t()}
  def sub(n1, n2) do
    with(
      {:ok, normalized_n1} <- Parser.parse(n1),
      {:ok, normalized_n2} <- Parser.parse(n2),
      {:ok, result} <- Parser.parse(normalized_n1 - normalized_n2)
    ) do
      {:ok, result}
    else
      {:error, message} -> {:error, message}
    end
  end

  @doc """
  Multiplies two numbers

  ## Examples
      iex> Calculator.mult(2, 3)
      {:ok, 6}
  """
  @spec mult(n1 :: number() | String.t(), n2 :: number() | String.t()) ::
          number() | {:error, String.t()}
  def mult(n1, n2) do
    with(
      {:ok, normalized_n1} <- Parser.parse(n1),
      {:ok, normalized_n2} <- Parser.parse(n2),
      {:ok, result} <- Parser.parse(normalized_n1 * normalized_n2)
    ) do
      {:ok, result}
    else
      {:error, message} -> {:error, message}
    end
  end

  @doc """
  Divides two numbers

  ## Examples
      iex> Calculator.div(6, 2)
      {:ok, 3}
  """
  @spec div(n1 :: number() | String.t(), n2 :: number() | String.t()) ::
          number() | {:error, String.t()}
  def div(n1, n2) do
    with(
      {:ok, normalized_n1} <- Parser.parse(n1),
      {:ok, normalized_n2} when normalized_n2 !== 0 <- Parser.parse(n2),
      {:ok, result} <- Parser.parse(normalized_n1 / normalized_n2)
    ) do
      {:ok, result}
    else
      {:ok, 0} -> {:error, "Can't divide by zero"}
      {:error, message} -> {:error, message}
    end
  end
end
