module TEA.Complete.Happenings.Msg exposing (..)

import Time exposing (Time)
import TEA.Complete.Happenings.Model as Model
import TEA.Components.Dropdown as Dropdown


type Msg
    = Add Model.Happening
    | Delete Model.Record
    | SelectNewHappening (Dropdown.Msg Model.NewHappening)
    | Newannotation String
    | Tick Time
      -- | ReachTheNextWorld Model.Self
    | NoOp
