module TEA.Complete.EMF0 exposing (..)

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


update : Time -> EMFState -> ( EMFState, Cmd Time )
update delta model =
    let
        cycle : (Int -> Bool) -> Light
        cycle relative =
            if relative (floor model.clock % 3000) then
                On Color.blue
            else
                Off

        between x y z =
            x < z && z < y
    in
        ( { model
            | clock = model.clock + delta
            , a = cycle <| between 50 150
            , b = cycle <| between 100 200
            , c = cycle <| between 150 250
            , d = cycle <| between 200 300
            , e = cycle <| between 250 350
            , f = cycle <| between 300 600
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
