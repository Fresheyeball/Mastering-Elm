module TEA.Kit.Happenings.Msg exposing (..)

import TEA.Kit.Happenings.Model as Model


{-
   This is the Algebraic type that describes all the messages that will
   flow through our application. You can think about this like these actions
   represent user intentions. NoOp is generally a needed option, but should
   be omitted if possible.
-}


type Msg
    = Add Model.Happening
    | Delete Model.Record
    | Newannotation String
      -- TODO Wire up dropdown
    | NoOp
