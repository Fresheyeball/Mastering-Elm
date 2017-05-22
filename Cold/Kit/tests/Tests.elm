module Tests exposing (..)

import Test exposing (..)
import Fuzz exposing (..)
import Expect
import View
import Model
import Msg
import Update


btns : List Msg.Msg
btns =
    [ Msg.Play
    , Msg.Pause
    , Msg.StopEject
    , Msg.Rewind
    , Msg.FastForward
    , Msg.Record
    , Msg.Insert
    ]


default : Model.Model
default =
    Tuple.first <| Model.init { isCapable = True }


msg : Fuzzer Msg.Msg
msg =
    intRange 1 7
        |> Fuzz.map
            (\x ->
                case x of
                    1 ->
                        Msg.Play

                    2 ->
                        Msg.Pause

                    3 ->
                        Msg.StopEject

                    4 ->
                        Msg.Rewind

                    5 ->
                        Msg.FastForward

                    6 ->
                        Msg.Record

                    _ ->
                        Msg.Insert
            )


status : Fuzzer Model.Status
status =
    intRange 1 7
        |> Fuzz.map
            (\x ->
                case x of
                    1 ->
                        Model.Playing

                    2 ->
                        Model.Paused

                    3 ->
                        Model.Stopped

                    4 ->
                        Model.Ejected

                    5 ->
                        Model.Rewinding

                    6 ->
                        Model.FastForwarding

                    _ ->
                        Model.Recording
            )


statusNotEjected : Fuzzer Model.Status
statusNotEjected =
    status
        |> Fuzz.map
            (\x ->
                if x == Model.Ejected then
                    Model.Playing
                else
                    x
            )


btnManager : Test
btnManager =
    describe "Btn Manager"
        [ test "Playing" <|
            \() ->
                Expect.equal (List.map (View.btnMgr Model.Playing) btns)
                    [ View.Down, View.Up, View.Up, View.Up, View.Up, View.Up, View.Up ]
        , test "Paused" <|
            \() ->
                Expect.equal (List.map (View.btnMgr Model.Paused) btns)
                    [ View.Down, View.Down, View.Up, View.Up, View.Up, View.Up, View.Up ]
        , test "Stopped" <|
            \() ->
                Expect.equal (List.map (View.btnMgr Model.Stopped) btns)
                    [ View.Up, View.Up, View.Up, View.Up, View.Up, View.Up, View.Up ]
        , test "Ejected" <|
            \() ->
                Expect.equal (List.map (View.btnMgr Model.Ejected) btns)
                    [ View.Up, View.Up, View.Up, View.Up, View.Up, View.Up, View.Down ]
          -- TODO: Write Rewind Test
        , test "FastForwarding" <|
            \() ->
                Expect.equal (List.map (View.btnMgr Model.FastForwarding) btns)
                    [ View.Up, View.Up, View.Up, View.Up, View.Down, View.Up, View.Up ]
        ]


update : Test
update =
    describe "Update"
        [ describe "Play"
            [ fuzz status "plays unless ejected" <|
                \randomStatus ->
                    if randomStatus == Model.Ejected then
                        statusEq Msg.Play randomStatus Model.Ejected
                    else
                        statusEq Msg.Play randomStatus Model.Playing
            ]
        , describe "Pause"
            [ test "has no effect if Stopped" <|
                \() -> statusEq Msg.Pause Model.Stopped Model.Stopped
            , test "plays if already paused" <|
                \() -> statusEq Msg.Pause Model.Paused Model.Playing
            , fuzz status "pauses if not stopped, ejected, or already paused" <|
                \randomStatus ->
                    if List.any ((==) randomStatus) [ Model.Ejected, Model.Stopped, Model.Paused ] then
                        Expect.pass
                    else
                        statusEq Msg.Pause randomStatus Model.Paused
            ]
        , describe "StopEject"
            [ fuzz status "ejects if stopped, otherwise it stops" <|
                \randomStatus ->
                    if List.any ((==) randomStatus) [ Model.Stopped, Model.Ejected ] then
                        statusEq Msg.StopEject randomStatus Model.Ejected
                    else
                        statusEq Msg.StopEject randomStatus Model.Stopped
            ]
        , describe "Rewind"
            [ fuzz status "rewinds if not ejected" <|
                \randomStatus ->
                    if randomStatus == Model.Ejected then
                        Expect.pass
                    else
                        statusEq Msg.Rewind randomStatus Model.Rewinding
            ]
        , describe "FastForward"
            [ fuzz status "fast forwards if not ejected" <|
                \randomStatus ->
                    if randomStatus == Model.Ejected then
                        Expect.pass
                    else
                        statusEq Msg.FastForward randomStatus Model.FastForwarding
            ]
          -- TODO: Write tests for Insert
        ]


all : Test
all =
    describe "Tests..."
        [ btnManager
        , update
        ]


statusEq : Msg.Msg -> Model.Status -> Model.Status -> Expect.Expectation
statusEq msg instatus outstatus =
    Update.update msg { default | status = instatus }
        |> Tuple.first
        |> .status
        |> Expect.equal outstatus
