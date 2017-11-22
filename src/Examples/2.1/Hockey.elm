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
  , typedWinner : String
  , typedLoser : String
  }

init : Model
init =
  { games = []
  , typedWinner = ""
  , typedLoser = ""
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
        { model | typedWinner = player}
    TypeLoser player ->
        { model | typedLoser = player }
    Add ->
        { model
        | typedWinner = ""
        , typedLoser = ""
        , games = model.games ++ [{winner = model.typedWinner, loser = model.typedLoser}]
        }

viewGame game = li [] [text <| toString game]

viewGames games = ul [] <| List.map viewGame games

view model =
  div []
    [ div [] [ text "Winner" ]
    , input [onInput TypeWinner, value model.typedWinner] [ ]
    , div [] [ text "Loser" ]
    , input [onInput TypeLoser, value model.typedLoser] [ ]
    , button [onClick Add] [text "Add"]
    , viewGames model.games
    ]
