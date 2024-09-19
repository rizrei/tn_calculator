defmodule Calculator.Parser do
  @moduledoc """
  Parser for calculator input arguments
  """

  @doc """
  Normalizing input value to integer, or float number

  ## Examples
      iex> Calculator.Parser.parse(42)
      {:ok, 42}

      iex> Calculator.Parser.parse(42.0)
      {:ok, 42}

      iex> Calculator.Parser.parse("42")
      {:ok, 42}

      iex> Calculator.Parser.parse(:one)
      {:error, "Invalid argument! :one must be a number"}
  """
  @spec parse(n :: number() | String.t()) :: {:ok, number()} | {:error, String.t()}
  def parse(n) when is_float(n) and trunc(n) == n, do: {:ok, trunc(n)}
  def parse(n) when is_integer(n) or is_float(n), do: {:ok, n}

  def parse(n) when is_binary(n) do
    case Float.parse(n) do
      {float_number, ""} -> parse(float_number)
      _ -> must_be_a_number_error(n)
    end
  end

  def parse(n), do: must_be_a_number_error(n)

  defp must_be_a_number_error(n),
    do: {:error, "Invalid argument! " <> inspect(n) <> " must be a number"}
end
