import Expect
import Test exposing (..)
import Test.Runner.Html

import Ladder exposing (..)

aWinsOverB =
    { winner = "a"
    , loser = "b"
    }

games =
    [ ("empty", aWinsOverB, [], ["a", "b"])
    , ("switch", aWinsOverB, ["b", "a"], ["a", "b"])
    , ("last", aWinsOverB, ["c", "a"], ["c", "a", "b"])
    , ("switchBottom", aWinsOverB, ["c", "b", "a"], ["c", "a", "b"])
    ]

testOne (name, game, initial, expected) =
    let
        actual = Ladder.addGame initial game
    in
        test name (\_ -> Expect.equal expected actual)

main : Test.Runner.Html.TestProgram
main =
    List.map testOne games
    |> concat
    |> Test.Runner.Html.run
