import Expect
import Test exposing (..)
import Test.Runner.Html

import Ladder exposing (..)

aWinsOverB =
    { winner = "a"
    , loser = "b"
    }

games =
    [ ("Neither on list", aWinsOverB, [], ["a", "b"])
    , ("Winner before loser", aWinsOverB, ["c", "a", "d", "b"], ["c", "a", "d", "b"])
    , ("Loser before winner", aWinsOverB, ["b", "a"], ["a", "b"])
    , ("Only winner on ladder", aWinsOverB, ["c", "a", "d"], ["c", "a", "d", "b"])
    , ("Only loser on ladder", aWinsOverB, ["c", "b"], ["c", "a", "b"])

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
