module Main exposing (..)

import Html
import View
import Update
import Msg
import Model
import Subscriptions


main : Program Model.Flags Model.Model Msg.Msg
main =
    Html.programWithFlags
        { init = Model.init
        , view = View.view
        , update = Update.update
        , subscriptions = Subscriptions.subscriptions
        }
