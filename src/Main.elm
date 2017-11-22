import Presentation exposing (..)

main = markdownSlidesViewer slides "ws://localhost:9000"

slides =
    [ title
    , what_is
    , pitch
    ]


title = """

# Introduktion till Elm
nForum 2017-11-23

"""

what_is = """ 
# What is Elm?

> A delightful language for reliable webapps.
> Generate JavaScript with great performance and no runtime exceptions.

http://elm-lang.org/

"""


-- Elm består av ett språk en kompilator och en runtime. Kompilatorn tar Elm-kod och producerar javascript. Runtime driver applikationen i browsern och gör anrop in i våran applikation.
-- Sen finns det stödjande system som pakethanterare, REPL, formattering, editor-stöd, online-körning (ellie).


pitch = """

# Pitch

> * No runtime errors in practice. No null. No undefined is not a function.
> * Friendly error messages that help you add features more quickly.
> * Well-architected code that stays well-architected as your app grows.
> * Automatically enforced semantic versioning for all Elm packages.

Copied from: https://guide.elm-lang.org/

"""

app_structure = """

# Program structure

* model
* view
* update
* subscriptions

"""
-- En interaktiv applikation skriven i Elm består av en modell, en vyfunktion och en uppdateringsfunktion. (En icke interaktiv räcker med vy).
-- Med andra ord så följer Elm design-mönstret MVC (Model, View, Controller).
-- Relatera även till React + Redux
