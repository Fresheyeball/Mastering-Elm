module Msg exposing (..)

import Time


type Msg
    = Play
    | Pause
    | StopEject
    | Rewind
    | FastForward
    | Record
    | Insert
    | SetDuration Time.Time
    | Ended
    | Tick Time.Time
