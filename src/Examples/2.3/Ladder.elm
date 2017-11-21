module Ladder exposing (Player, Game, addGame)

import List.Extra exposing (elemIndex, splitAt, remove)

type alias Player = String

type alias Game =
    { winner : Player
    , loser : Player
    }

type alias Ladder = List Player

insertAt : Player -> Int -> Ladder -> Ladder
insertAt elem index ladder =
    let
        (before, after) = splitAt index ladder
    in
        before ++ elem :: after
        
addGame : Ladder -> Game -> Ladder
addGame ladder {winner, loser} =
    let
        maybeWinner = elemIndex winner ladder
        maybeLoser = elemIndex loser ladder
    in
        case (maybeWinner, maybeLoser) of
            _ -> []

























            
            -- (Nothing, Nothing ) ->
            --     ladder ++ [winner, loser]

            -- (Just _, Nothing) ->
            --     ladder ++ [loser]

            -- (Nothing, Just loserIndex) ->
            --     insertAt winner loserIndex ladder
            
            -- (Just winnerIndex, Just loserIndex) ->
            --     if loserIndex < winnerIndex then
            --         insertAt loser winnerIndex (remove loser ladder)
            --     else
            --         ladder

-- Neither on list
--  Winner before loser at end
-- Winner before loser
--  Nothing happens
-- Loser before winner
--   Remove winner, insert winner before loser
-- Only loser on ladder
--   Insert winner before loser
-- Only winner on ladder
--   Insert loser last on ladder
