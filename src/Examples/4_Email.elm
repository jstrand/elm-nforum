import Html exposing (Html, input, div, text, button)
import Html.Events exposing (onInput)
import Html.Attributes exposing (disabled)
import Regex

type alias Model =
  { editedEmail : String
  , addedEmails : List String
  }

init : Model
init =
  { editedEmail = ""
  , addedEmails = []
  }

main =
  Html.beginnerProgram { model = init, view = view, update = update }

type Msg = EmailTyping String

update msg model =
  case msg of
    EmailTyping text ->
        { model | editedEmail = text }

emailRegex = Regex.regex ".+\\@.+\\..{2,4}"

isEmail email = Regex.contains emailRegex email

-- enabled valid = disabled (not valid)
enabled = not >> disabled

view model =
  let
    addButtonStatus = model.editedEmail |> isEmail |> enabled
  in
    div []
      [ div [] [ text "E-mail" ]
      , input [onInput EmailTyping] [ ]
      , button [addButtonStatus] [text "Add"]
      ]
