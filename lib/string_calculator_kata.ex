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

  def add(string_operation) do
    check_negative_numbers!(string_operation)
    |> extract_delimiters
    |> sum
  end

  def check_negative_numbers!(string_operation) do
    negatives =
      Regex.scan(~r{(-\d+)}, string_operation, [capture: :first] )
      |> Enum.map(fn(x)-> Enum.fetch!(x, 0) end)
      |> Enum.join(", ")

    cond do
      String.length(negatives) >= 2 ->
        raise ArgumentError, "Negative numbers not allowed (#{negatives})"
      true -> string_operation
    end
      
  end

  def sum({delimiter, string_op}) do
    String.splitter(string_op, @delimiters ++ delimiter)
    |> Enum.map(&check_number!/1)
    |> Enum.sum
  end

  def check_number!(n) do
    case Integer.parse(n)  do
      :error  -> raise ("#{n} is not a valid number")
      {f, _} -> f
    end
  end

  def extract_delimiters("") do
   {[], ""}
  end

  def extract_delimiters(string_op) when length(string_op) < 2  do
    {[], string_op}
  end

  def extract_delimiters(string_op) do
    #Using a regular expression for find out delimiters
    case String.match?(string_op, ~r"\D{1}\n(\w|\W){2,}") do
      true -> {[String.at(string_op, 0)], String.slice(string_op, 2..2500)}
      false -> {[], string_op}
    end
  end

end
