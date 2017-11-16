import Html exposing (Html, input, div, text, button, ul, li)
import Html.Events exposing (onInput, onClick)
import Html.Attributes exposing (disabled, value)
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

type Msg = EmailTyping String | Add

update msg model =
  case msg of
    EmailTyping text ->
        { model | editedEmail = text }
    Add ->
        { model
        | editedEmail = ""
        , addedEmails = model.editedEmail :: model.addedEmails }

emailRegex = Regex.regex ".+\\@.+\\..{2,4}"

isEmail email = Regex.contains emailRegex email

enabled = not >> disabled

viewEmail email = li [] [text email]

viewEmails emails = ul [] <| List.map viewEmail emails

view model =
  let
    addButtonStatus = model.editedEmail |> isEmail |> enabled
  in
    div []
      [ div [] [ text "E-mail" ]
      , input [onInput EmailTyping, value model.editedEmail] [ ]
      , button [addButtonStatus, onClick Add] [text "Add"]
      , viewEmails model.addedEmails
      ]
