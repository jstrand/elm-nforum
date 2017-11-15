import Presentation exposing (..)
import Formatting exposing (..)

main = markdownSlidesViewer slides "ws://localhost:9000"

slides =
    [ title
    , what_is
    , horses_mouth
    ]


title = """

# Introduktion till Elm
nForum 2017-11-23

"""

what_is = """ 
# Vad är Elm?

A delightful language for reliable webapps.
Generate JavaScript with great performance and no runtime exceptions.

http://elm-lang.org/

"""


-- Elm består av ett språk en kompilator och en runtime. Kompilatorn tar Elm-kod och producerar javascript. Runtime driver applikationen i browsern och gör anrop in i våran applikation.
-- Sen finns det stödjande system som pakethanterare, REPL, formattering, editor-stöd, online-körning (ellie).


horses_mouth = """

# Ur hästens mun

> * No runtime errors in practice. No null. No undefined is not a function.
> * Friendly error messages that help you add features more quickly.
> * Well-architected code that stays well-architected as your app grows.
> * Automatically enforced semantic versioning for all Elm packages.

https://guide.elm-lang.org/

"""

app_structure = """

# Programstruktur

* model
* view
* update
* subscriptions

"""
-- En interaktiv applikation skriven i Elm består av en modell, en vyfunktion och en uppdateringsfunktion. (En icke interaktiv räcker med vy).
-- Med andra ord så följer Elm design-mönstret MVC (Model, View, Controller).


hello_email = """

```
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
```

"""
