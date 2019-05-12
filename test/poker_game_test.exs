require IEx

defmodule PokerGameTest do
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

    assert true == PokerGame.valid_card?(card_1)
    assert true == PokerGame.valid_card?(card_2)
    assert false == PokerGame.valid_card?(card_3)
    assert false == PokerGame.valid_card?(card_4)
    assert false == PokerGame.valid_card?(card_5)
    assert false == PokerGame.valid_card?(card_6)
    assert false == PokerGame.valid_card?(card_7)
    assert true == PokerGame.valid_card?(card_8)
  end

  test "only valid cards are stored in hand" do
    hand = PokerGame.hand(["2D", "AHjahg", "9H", "1C", "KS"])
    assert false == PokerGame.all_valid_cards?(hand)
  end

  test "a hand can only contain 5 cards" do
    hand_1 = PokerGame.hand(["2D", "3D", "9H", "8C", "KS"])
    hand_2 = PokerGame.hand(["2D", "3D", "9D"])
    hand_3 = PokerGame.hand(["2D", "3D", "9D", "6S"])

    assert true == PokerGame.valid_hand?(hand_1)
    assert false == PokerGame.valid_hand?(hand_2)
    assert false == PokerGame.valid_hand?(hand_3)
  end

  test "it can hold hand" do
    hand = PokerGame.hand(["2D", "3D", "9H", "8C", "KS"])

    assert ["2D", "3D", "9H", "8C", "KS"] == hand
    assert 5 == PokerGame.card_count(hand)
  end

  test "it can hold multiple hands" do
    hand_1 = PokerGame.hand(["2D", "3D", "9H", "8C", "KS"])
    hand_2 = PokerGame.hand(["2D", "3D", "9D", "8H", "KS"])

    assert hand_1 == ["2D", "3D", "9H", "8C", "KS"]
    assert hand_2 == ["2D", "3D", "9D", "8H", "KS"]
  end
end
