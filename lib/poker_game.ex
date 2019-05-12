require IEx

defmodule PokerGame do
  @moduledoc """
  Documentation for PokerGame.
  """

  def values() do
    ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
  end

  def suits() do
    ["S", "D", "C", "H"]
  end

  def hand(hand) do
    hand
  end

  def valid_hand?(hand) do
    card_count(hand) == 5
  end

  def card_count(hand) do
    Enum.count(hand)
  end

  def all_valid_cards?(hand) do
    Enum.all?(hand, fn x -> valid_card?(x) == true end)
  end

  def valid_card?(card) do
    value = Enum.at(converted(card), 0)
    suit = Enum.at(converted(card), 1)
    Enum.count(converted(card)) == 2 &&
    valid_value?(value) &&
    valid_suit?(suit)
  end

  def valid_value?(value) do
    Enum.any?(values(), fn x -> x == value end)
  end

  def valid_suit?(suit) do
    Enum.any?(suits(), fn x -> x == suit end)
  end

  def converted(card) do
    String.split(card, "")
    |> Enum.drop(-1)
    |> Enum.drop(1)
  end
end
