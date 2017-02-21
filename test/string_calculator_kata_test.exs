defmodule StringCalculatorKataTest do
  use ExUnit.Case
  doctest StringCalculatorKata

  import StringCalculatorKata

  test "sum with empty string" do
    assert add("") == 0
  end
end
