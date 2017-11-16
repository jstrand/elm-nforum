import Html exposing (Html, input, div, text, button, ul, li)
import Html.Events exposing (onInput, onClick)
import Html.Attributes exposing (disabled, value)

type alias Player = String

type alias Game =
    { winner : Player
    , loser : Player
    }

type alias Model =
  { games : List Game
  , winner : String
  , loser : String
  }

init : Model
init =
  { games = []
  , winner = ""
  , loser = ""
  }

main =
  Html.beginnerProgram { model = init, view = view, update = update }

type Msg =
      TypeWinner String
    | TypeLoser String
    | Add

update msg model =
  case msg of
    TypeWinner player ->
        { model | winner = player}
    TypeLoser player ->
        { model | loser = player }
    Add ->
        { model
        | winner = ""
        , loser = ""
        , games = {winner = model.winner, loser = model.loser} :: model.games
        }

viewGame game = li [] [text <| toString game]

viewGames games = ul [] <| List.map viewGame games

view model =
  div []
    [ div [] [ text "Winner" ]
    , input [onInput TypeWinner, value model.winner] [ ]
    , div [] [ text "Loser" ]
    , input [onInput TypeLoser, value model.loser] [ ]
    , button [onClick Add] [text "Add"]
    , viewGames model.games
    ]
