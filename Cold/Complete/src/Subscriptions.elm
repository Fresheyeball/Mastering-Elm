module Subscriptions exposing (..)

import Model
import Msg
import Time
import Audio


every : Sub Msg.Msg
every =
    let
        sample =
            Time.millisecond * 10
    in
        Time.every sample (always (Msg.Tick sample))


subscriptions : Model.Model -> Sub Msg.Msg
subscriptions { status } =
    Sub.batch
        [ Audio.ended
        , Audio.setDuration
        , case status of
            Model.Rewinding ->
                every

            Model.FastForwarding ->
                every

            Model.Playing ->
                every

            _ ->
                Sub.none
        ]
