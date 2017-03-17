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
    string_operation
    |> extract_delimiters
    |> sum
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
    case String.at(string_op, 1)  do
      "\n" -> extract(String.at(string_op,0), String.slice(string_op, 2..2000))
      _ -> {[], string_op}
    end    
  end

  def extract(delimiter, string_op) do
    if is_valid_delimiter(delimiter) do
      {[delimiter], string_op}
    else
     {[], delimiter <> "\n" <> string_op}
    end
  end

  def is_valid_delimiter(n) do
    case Integer.parse(n) do
      :error -> true
      _  -> false
    end
  end

end
