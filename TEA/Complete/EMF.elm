module TEA.Complete.EMF exposing (..)

import Time exposing (Time)
import Html exposing (..)
import Html.Attributes exposing (..)
import Color exposing (Color)
import AnimationFrame exposing (diffs)


type Light
    = Off
    | On Color


type alias EMFState =
    { a : Light
    , b : Light
    , c : Light
    , d : Light
    , e : Light
    , f : Light
    , clock : Time
    }


init : EMFState
init =
    EMFState Off Off Off Off Off Off 0


flicker : Time -> Time -> Time -> Color -> Light
flicker time on off color =
    if floor time % floor (on + off) < floor off then
        On color
    else
        Off


update : Time -> EMFState -> ( EMFState, Cmd Time )
update delta model =
    ( { model
        | clock = model.clock + delta
        , a = flicker model.clock 1000 1000 Color.blue
        , b =
            flicker model.clock
                2000
                1000
                (if model.f == Off then
                    Color.blue
                 else if model.c == Off then
                    Color.green
                 else
                    Color.red
                )
        , c =
            flicker model.clock
                500
                3000
                (if model.b == Off then
                    Color.blue
                 else
                    Color.red
                )
        , d =
            flicker model.clock
                800
                4000
                (if model.a == Off then
                    Color.blue
                 else
                    Color.red
                )
        , e =
            flicker model.clock
                1000
                500
                (if model.d == Off then
                    Color.blue
                 else
                    Color.red
                )
        , f =
            flicker model.clock
                100
                500
                (if model.e == Off then
                    Color.blue
                 else if model.a == Off then
                    Color.lightOrange
                 else
                    Color.red
                )
      }
    , Cmd.none
    )


light : ( Int, Int ) -> Light -> Html msg
light ( x, y ) light =
    let
        rgba =
            case light of
                On color ->
                    Color.toRgb color

                Off ->
                    Color.toRgb Color.white

        cssColor =
            "rgb("
                ++ toString rgba.red
                ++ ","
                ++ toString rgba.green
                ++ ","
                ++ toString rgba.blue
                ++ ")"
    in
        div
            [ style
                [ ( "background", cssColor )
                , ( "box-shadow", "0 0 20px " ++ cssColor )
                , ( "position", "absolute" )
                , ( "width", "20px" )
                , ( "height", "20px" )
                , ( "top", toString y ++ "px" )
                , ( "left", toString x ++ "px" )
                ]
            ]
            []


view : EMFState -> Html msg
view { a, b, c, d, e, f, clock } =
    div
        [ style
            [ ( "width", "800px" )
            , ( "height", "100%" )
            , ( "margin", "0 auto" )
            , ( "position", "relative" )
            ]
        ]
        [ img
            [ src "/Assets/EMFmeter.png"
            , style
                [ ( "position", "absolute" )
                , ( "z-index", "2" )
                ]
            ]
            []
        , light ( 150, 92 ) a
        , light ( 196, 88 ) b
        , light ( 210, 60 ) c
        , light ( 314, 26 ) d
        , light ( 319, 70 ) e
        , light ( 375, 135 ) f
        ]


subscriptions : EMFState -> Sub Time
subscriptions _ =
    diffs identity


main : Program Never EMFState Time
main =
    program
        { init = ( init, Cmd.none )
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
