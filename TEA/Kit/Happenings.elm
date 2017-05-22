module TEA.Kit.Happenings exposing (..)

import Html
import TEA.Kit.Happenings.Msg as Msg exposing (Msg)
import TEA.Kit.Happenings.Model as Model exposing (Model)
import TEA.Kit.Happenings.Update as Update
import TEA.Kit.Happenings.View as View


main : Program Never Model Msg
main =
    Html.program
        { init = ( Model.init, Cmd.none )
        , update = Update.update
        , view = View.view
        , subscriptions = always Sub.none
        }
