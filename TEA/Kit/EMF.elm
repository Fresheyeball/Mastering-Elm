module TEA.Kit.EMF exposing (..)

import Time exposing (Time)
import Html exposing (..)
import Html.Attributes exposing (..)
import Color exposing (Color)
import AnimationFrame exposing (diffs)


{-
   Your goal here is to make the lights do stuff!
-}


type Light
    = Off
    | On Color



{-
   This is the monolithic Model of the EMF meter.
-}


type alias EMFState =
    { a : Light
    , b : Light
    , c : Light
    , d : Light
    , e : Light
    , f : Light
    , clock : Time
    }



{-
   When the application starts, this will be the EMF meter's state.
-}


init : EMFState
init =
    EMFState Off Off Off Off Off Off 0



{-
   As time passes, this update function is responsible for
   updating the state. Do your work in here.
-}


update : Time -> EMFState -> ( EMFState, Cmd Time )
update delta model =
    ( model, Cmd.none )



-- This function draws an individual light


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



{-
   This is the monolithic view function for the EMF meter
-}


view : EMFState -> Html a
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
          -- do not alter these numbers, they position the lights in the view
        , light ( 150, 92 ) a
        , light ( 196, 88 ) b
        , light ( 210, 60 ) c
        , light ( 314, 26 ) d
        , light ( 319, 70 ) e
        , light ( 375, 135 ) f
        ]


main : Program Never EMFState Time
main =
    program
        { init = ( init, Cmd.none )
        , update = update
        , view = view
        , subscriptions = \_ -> diffs identity
        }
