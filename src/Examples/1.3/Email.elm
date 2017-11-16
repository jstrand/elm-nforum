import Html exposing (Html, input, div, text, button)
import Html.Events exposing (onInput)
import Html.Attributes exposing (disabled, value)
import Regex

main =
  Html.beginnerProgram { model = "", view = view, update = update }

type Msg = EmailTyping String

update msg model =
  case msg of
    EmailTyping text ->
        text

emailRegex = Regex.regex ".+\\@.+\\..{2,4}"

isEmail email = Regex.contains emailRegex email

-- enabled valid = disabled (not valid)
enabled = not >> disabled

view model =
  let
    addButtonStatus = model |> isEmail |> enabled
  in
    div []
      [ div [] [ text "E-mail" ]
      , input [onInput EmailTyping, value model] [ ]
      , button [addButtonStatus] [text "Add"]
      ]
