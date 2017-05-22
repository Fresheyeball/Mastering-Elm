module TEA.Complete.Happenings exposing (..)

import Html
import Time
import TEA.Complete.Happenings.Msg as Msg exposing (Msg)
import TEA.Complete.Happenings.Model as Model exposing (Model)
import TEA.Complete.Happenings.Update as Update
import TEA.Complete.Happenings.View as View


main : Program Never Model Msg
main =
    Html.program
        { init = ( Model.init, Cmd.none )
        , update = Update.update
        , view = View.view
        , subscriptions = always (Time.every Time.second Msg.Tick)
        }
