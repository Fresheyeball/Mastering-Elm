port module Audio
    exposing
        ( stop
        , play
        , clickSoft
        , clickHard
        , setDuration
        )

import Msg


port stop_ : () -> Cmd msg


stop : Cmd msg
stop =
    stop_ ()


port play_ : () -> Cmd msg


play : Cmd msg
play =
    play_ ()



{-
   TODO: Wireup seek port
   This port should be

   port seek_ : Float -> Cmd msg
   seek : Float -> Cmd msg

   Keep in mind the audio object api
   takes a number it terms of seconds.
-}


port clickSoft_ : () -> Cmd msg


clickSoft : Cmd msg
clickSoft =
    clickSoft_ ()


port clickHard_ : () -> Cmd msg


clickHard : Cmd msg
clickHard =
    clickHard_ ()



{-
   TODO: Wireup ended port
   This port should be

   port ended_ : (() -> msg) -> Sub msg
   ended : Sub Msg.Msg

   Where the subscription fires a `Msg.Stop`
-}


port setDuration_ : (Float -> msg) -> Sub msg


setDuration : Sub Msg.Msg
setDuration =
    setDuration_ (Msg.SetDuration << (*) 1000)
