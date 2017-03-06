defmodule StringCalculatorKata do
  @moduledoc """
  Documentation for StringCalculatorKata.
  """

  @doc """
  Calculates the sum of a number passed as an argument string
  """
  def add("") do
    0
  end

  def add(operation) do
    String.splitter(operation, ",")
    |> Enum.map(&check_number/1)
    |> Enum.sum
  end

  def check_number(n) do
    case Float.parse(n)  do
      :error  -> 0
      {f, _} -> f
    end
  end
  
end
