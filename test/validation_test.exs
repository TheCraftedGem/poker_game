require IEx

defmodule ValidationTest do
  import Validation
  use ExUnit.Case

  test "can validate single card" do
    card_1 = "AS"
    card_2 = "2D"
    card_3 = "43"
    card_4 = "1"
    card_5 = "111"
    card_6 = "AA"
    card_7 = "DDDDDD"
    card_8 = "KD"

    assert true == Validation.valid_card?(card_1)
    assert true == Validation.valid_card?(card_2)
    assert false == Validation.valid_card?(card_3)
    assert false == Validation.valid_card?(card_4)
    assert false == Validation.valid_card?(card_5)
    assert false == Validation.valid_card?(card_6)
    assert false == Validation.valid_card?(card_7)
    assert true == Validation.valid_card?(card_8)
  end

end
