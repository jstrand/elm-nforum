import Html exposing (Html, input, div, text)
import Html.Events exposing (onInput)

main =
  Html.beginnerProgram { model = "", view = view, update = update }

type Msg = EmailTyping String

update msg model =
  case msg of
    EmailTyping text ->
        text

view model =
  div []
    [ div [] [ text "E-mail" ]
    , input [ onInput EmailTyping ] [ ]
    , div [] [ text model ]
    ]
