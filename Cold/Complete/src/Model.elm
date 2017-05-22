module Model
    exposing
        ( Capable
        , isCapable
        , Flags
        , init
        , Model
        , Status(..)
        )

import Time


type Status
    = Playing
    | Paused
    | Stopped
    | Ejected
    | Rewinding
    | FastForwarding
    | Recording


type alias Model =
    { playhead : Time.Time
    , status : Status
    , isCapable : Capable
    , duration : Time.Time
    }


type Capable
    = Capable Bool


isCapable : Capable -> Bool
isCapable (Capable b) =
    b


type alias Flags =
    { isCapable : Bool }


init : Flags -> ( Model, Cmd msg )
init { isCapable } =
    ( { playhead = 0
      , status = Ejected
      , isCapable = Capable isCapable
      , duration = 0
      }
    , Cmd.none
    )
