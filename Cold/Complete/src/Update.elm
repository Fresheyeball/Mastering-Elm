module Update exposing (..)

import Time
import Msg
import Model
import Audio


outOfTape : Time.Time -> Model.Model -> Bool
outOfTape delta { playhead, duration } =
    let
        delta_ =
            playhead + delta
    in
        duration < delta_ || delta_ < 0


update : Msg.Msg -> Model.Model -> ( Model.Model, Cmd Msg.Msg )
update msg ({ status } as model) =
    case ( msg, status ) of
        ( Msg.SetDuration duration, _ ) ->
            ( { model | duration = duration }, Cmd.none )

        ( Msg.Insert, Model.Ejected ) ->
            ( { model | status = Model.Stopped }, Audio.clickHard )

        ( _, Model.Ejected ) ->
            ( model, Cmd.none )

        ( Msg.Play, _ ) ->
            if outOfTape 0 model then
                ( model, Cmd.none )
            else
                { model | status = Model.Playing } ! [ Audio.play, Audio.clickSoft ]

        ( Msg.Pause, Model.Stopped ) ->
            ( model, Cmd.none )

        ( Msg.Pause, Model.Paused ) ->
            update Msg.Play model

        ( Msg.Pause, _ ) ->
            { model | status = Model.Paused } ! [ Audio.stop, Audio.clickSoft ]

        ( Msg.StopEject, Model.Stopped ) ->
            ( { model | status = Model.Ejected }, Audio.clickHard )

        ( Msg.StopEject, _ ) ->
            { model | status = Model.Stopped } ! [ Audio.stop, Audio.clickHard ]

        ( Msg.Rewind, _ ) ->
            if outOfTape 0 model then
                ( model, Cmd.none )
            else
                { model | status = Model.Rewinding } ! [ Audio.stop, Audio.clickSoft ]

        ( Msg.FastForward, _ ) ->
            if outOfTape 0 model then
                ( model, Cmd.none )
            else
                { model | status = Model.FastForwarding } ! [ Audio.stop, Audio.clickSoft ]

        ( Msg.Tick delta, Model.Rewinding ) ->
            let
                delta_ =
                    0 - delta * 3

                playhead_ =
                    model.playhead + delta_
            in
                if outOfTape delta_ model then
                    update Msg.StopEject model
                else
                    ( { model | playhead = playhead_ }, Audio.seek playhead_ )

        ( Msg.Tick delta, Model.FastForwarding ) ->
            let
                delta_ =
                    delta * 3

                playhead_ =
                    model.playhead + delta_
            in
                if outOfTape delta_ model then
                    update Msg.StopEject model
                else
                    ( { model | playhead = playhead_ }, Audio.seek playhead_ )

        ( Msg.Tick delta, Model.Playing ) ->
            if outOfTape delta model then
                update Msg.StopEject model
            else
                ( { model | playhead = model.playhead + delta }, Cmd.none )

        ( Msg.Ended, _ ) ->
            update Msg.StopEject { model | playhead = model.duration }

        _ ->
            ( model, Cmd.none )
