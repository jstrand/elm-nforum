import Html exposing (Html, input, div, text)
import Html.Events exposing (onInput)
import Html.Attributes exposing (style)
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

inputStyle valid =
  if valid then
    style [("background", "green")]
  else
    style []

view model =
  let
    emailInputStyle =
      model
      |> isEmail
      |> inputStyle
    
  in
    div []
      [ div [] [ text "E-mail" ]
      , input [emailInputStyle, onInput EmailTyping] [ ]
      ]
