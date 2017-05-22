port module Audio
    exposing
        ( stop
        , play
        , seek
        , clickSoft
        , clickHard
        , ended
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


port seek_ : Float -> Cmd msg


seek : Float -> Cmd msg
seek =
    seek_ << flip (/) 1000


port clickSoft_ : () -> Cmd msg


clickSoft : Cmd msg
clickSoft =
    clickSoft_ ()


port clickHard_ : () -> Cmd msg


clickHard : Cmd msg
clickHard =
    clickHard_ ()


port ended_ : (() -> msg) -> Sub msg


ended : Sub Msg.Msg
ended =
    ended_ (always Msg.Ended)


port setDuration_ : (Float -> msg) -> Sub msg


setDuration : Sub Msg.Msg
setDuration =
    setDuration_ (Msg.SetDuration << (*) 1000)
