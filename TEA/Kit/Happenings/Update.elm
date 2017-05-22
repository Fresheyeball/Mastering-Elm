module TEA.Kit.Happenings.Update exposing (..)

import TEA.Kit.Happenings.Model as Model exposing (Model)
import TEA.Kit.Happenings.Msg as Msg exposing (Msg)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msg.Add happening ->
            ( { model
                -- TODO: Use the current time for records
                -- when creating them, instead of 0.
                | records =
                    ( happening, 0 ) :: model.records
                    -- TODO: Reset the add happening form
              }
            , Cmd.none
            )

        Msg.Delete record ->
            -- TODO: Impliment deletion logic
            ( model
            , Cmd.none
            )

        -- TODO: Wire up dropdown
        Msg.Newannotation annotation ->
            ( { model | annotation = annotation }, Cmd.none )

        Msg.NoOp ->
            ( model, Cmd.none )
