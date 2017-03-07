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

  test "sum with two numbers" do
    testing("1,1", 2)
    testing("21,1", 22)
    testing("3,62", 65)
    testing("5,13", 18)
  end

  test "sum with a random number of parameters" do
    testing("1,1,1", 3)
    testing("1", 1)
    testing("20,2", 22)
    testing("0,2,3,4", 9)
    testing("1,2,3,4,5,6", 21)
  end

  test "introducing not valid numbers" do
    assert_raise(RuntimeError, fn->
      add("adfasdfasdf") end
    )
  end

  test "sum numbers separated by colon or line breaks" do
    testing("1,1", 2)
    testing("1\n1", 2)
    testing("1\n1\n3",5)
    testing("1,2\n4\n3,5,6\n7", 28)
  end

  test "You can introduce separator in the first element of string, and separating by \n" do
    testing(".\n1,2,3\n3,1,2", 12)
    testing(".\n1,2.3\n3.1,2", 12)
  end


  defp testing(number, expected) do
    assert add(number) == expected
  end


end
