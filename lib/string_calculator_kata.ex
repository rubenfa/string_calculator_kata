defmodule StringCalculatorKata do
  @moduledoc """
  Documentation for StringCalculatorKata.
  """

 @delimiters [",", "\n"]


  @doc """
  Calculates the sum of a number passed as an argument string
  """
  def add("") do
    0
  end

  def add(operation) do
    {delimiter, op } = split(operation)
   
    cond do      
      is_valid_separtor(delimiter) -> start_add(op, [delimiter])
      true -> start_add(operation)
    end
  end

  defp start_add(operation, separated_by \\ []) do
   
    String.splitter(operation, Enum.concat([@delimiters, separated_by]))
    |> Enum.map(&check_number!/1)
    |> Enum.sum
  end

  def check_number!(n) do
    case Integer.parse(n)  do
      :error  -> raise ("#{n} is not a valid number")
      {f, _} -> f
    end
  end

  def is_valid_separtor(n) do
    case Integer.parse(n) do
      :error -> true
      _  -> false
    end
  end

  defp split(op) do
    case String.split_at(op, 1) do
      {delimiter, "\n" <> op} -> {delimiter, op}
      {delimiter, op} -> {delimiter, op}
    end
  end
end
