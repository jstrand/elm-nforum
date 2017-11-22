module Ladder exposing (..)

type alias Player = String

type alias Game =
    { winner : Player
    , loser : Player
    }

type alias Ladder = List Player

addGame : Ladder -> Game -> Ladder
addGame ladder game = ladder
