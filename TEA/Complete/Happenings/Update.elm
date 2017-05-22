module TEA.Complete.Happenings.Update exposing (..)

import TEA.Complete.Happenings.Model as Model exposing (Model)
import TEA.Complete.Happenings.Msg as Msg exposing (Msg)
import TEA.Components.Dropdown as Dropdown


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msg.Add happening ->
            let
                selector =
                    model.selector
            in
                ( { model
                    | records = ( happening, model.clock ) :: model.records
                    , annotation = ""
                    , selector = { selector | selected = Nothing }
                  }
                , Cmd.none
                )

        Msg.Delete record ->
            ( { model
                | records =
                    List.filter ((/=) record) model.records
              }
            , Cmd.none
            )

        Msg.SelectNewHappening dropdownMsg ->
            ( { model
                | selector =
                    Dropdown.update dropdownMsg model.selector
              }
            , Cmd.none
            )

        Msg.Newannotation annotation ->
            ( { model | annotation = annotation }, Cmd.none )

        Msg.Tick now ->
            ( { model | clock = now }, Cmd.none )

        Msg.NoOp ->
            ( model, Cmd.none )
