module TEA.Complete.Happenings.Model exposing (..)

import Time exposing (Time)
import TEA.Components.Dropdown as Dropdown


type Happening
    = Knocks Knocks
    | Coldspot
    | Floating Object


type NewHappening
    = NewKnocks
    | NewColdspot
    | NewFloating


initialSelector : Dropdown.Model NewHappening
initialSelector =
    let
        displayNewHappening nh =
            case nh of
                NewKnocks ->
                    "Knock"

                NewColdspot ->
                    "Cold Spot"

                NewFloating ->
                    "Floating Object"
    in
        Dropdown.init displayNewHappening
            "Please Select"
            Nothing
            [ NewKnocks
            , NewColdspot
            , NewFloating
            ]


type Object
    = Object String


type alias Knocks =
    Int


type alias Record =
    ( Happening, Time )


type alias Model =
    { records : List Record
    , selector : Dropdown.Model NewHappening
    , annotation : String
    , clock : Time
    }


init : Model
init =
    { records = []
    , selector = initialSelector
    , annotation = ""
    , clock = 0
    }
