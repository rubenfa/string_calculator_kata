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
    String.to_integer(operation)
  end


end
