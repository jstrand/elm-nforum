module Presentation exposing (markdownSlidesViewer)

import Html

import Presentation.Main exposing (initialModel)
import Presentation.Subscriptions exposing (presentationSubscriptions)
import Presentation.Update exposing (updatePresentation)
import Presentation.View exposing (viewPresentation)
import Presentation.Types

markdownSlidesViewer : List String -> String -> Program Never Presentation.Types.Model Presentation.Types.Msg
markdownSlidesViewer slides flipUrl =
  Html.program
    { init = initialModel slides flipUrl
    , view = viewPresentation
    , update = updatePresentation
    , subscriptions = presentationSubscriptions
    }
