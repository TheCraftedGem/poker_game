require IEx

defmodule PokerGame do

  def values(), do:
    %{"2" => 2, "3" => 3,
      "4" => 4, "5" => 5,
      "6" => 6, "7" => 7,
      "8" => 8, "9" => 9,
      "10" => 10, "J" => 11,
      "Q" => 12, "K" => 13,
      "A" => 14}

  def suits(), do: %{"S" => 10, "D" => 20, "C" => 30, "H" => 40}

  def hand(hand), do: hand

  def valid_hand?(hand), do: card_count(hand) == 5 && all_valid_cards?(hand)

  def card_count(hand), do: Enum.count(hand)

  def all_valid_cards?(hand), do: Enum.all?(hand, fn x -> valid_card?(x) == true end)

  def valid_card?(card) do
    case Enum.count(convert(card)) do
      2 -> valid_value?(Enum.at(convert(card), 0)) && valid_suit?(Enum.at(convert(card), -1))
      3 -> valid_value?("#{Enum.at(PokerGame.convert(card), 0)}#{Enum.at(PokerGame.convert(card), 1)}") && valid_suit?(Enum.at(convert(card), -1))
      _ -> false
    end
  end

  def valid_value?("10") do
    true
  end

  def valid_value?(value) do
    Enum.any?(Map.keys(values()), fn x -> x == value end)
  end

  def valid_suit?(suit) do
    Enum.any?(Map.keys(suits()), fn x -> x == suit end)
  end

  def convert(card) do
    String.split(card, "")
    |> Enum.reject(fn x -> x == "" end)
  end

  def convert_ten(suit) do
    ["10", suit]
  end

  def split_hand(hand) do
    Enum.map(hand, fn x ->
      case Enum.count(convert(x)) do
        2 -> convert(x)
        _ -> convert_ten(Enum.at(convert(x), -1))
      end
    end)
  end

  def compare(hand_1, hand_2) do
    if valid_hand?(hand_1) && valid_hand?(hand_2) do
      hand_1 = split_hand(hand_1)
      hand_2 = split_hand(hand_2)
      IEx.pry
      group_1 = Enum.reverse(Enum.sort(Enum.group_by(hand_1, fn x ->
                  values()[Enum.at( x, 0)]  end)))

      group_2 = Enum.reverse(Enum.sort(Enum.group_by(hand_2, fn x ->
                  values()[Enum.at( x, 0)]  end)))

                  IEx.pry

      #Exampkle Of Return "Black Wins - #{high card: Ace}
      #To Find Straights Sort Cards and subtract low card from high, if equal to 4 it's a straight


    end
  end
end
