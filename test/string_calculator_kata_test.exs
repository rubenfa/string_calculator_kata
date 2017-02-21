defmodule StringCalculatorKataTest do
  use ExUnit.Case
  doctest StringCalculatorKata

  import StringCalculatorKata

  test "sum with empty string" do
    assert add("") == 0
  end

  test "sum with one number" do
    testing("1", 1)
    testing("2", 2)
    testing("22", 22)
    testing("333", 333)
  end

  # test "sum with two numbers" do
  #   testing("1,1", 2)
  # end


  defp testing(number, expected) do
    assert add(number) == expected
  end


end
