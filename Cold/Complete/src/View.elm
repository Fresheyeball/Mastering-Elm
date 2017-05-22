module View exposing (..)

import Html exposing (..)
import Svg
import Svg.Attributes as SvgAttributes
import Svg.Events as Events
import Html.Attributes as Attributes
import Model
import Msg


type ButtonState
    = Up
    | Down


unsupported : Model.Capable -> Html msg -> Html msg
unsupported capable normie =
    if Model.isCapable capable then
        normie
    else
        h1 [] [ text "your browser does not support audio" ]


btnMgr : Model.Status -> Msg.Msg -> ButtonState
btnMgr status msg =
    case ( status, msg ) of
        ( Model.Playing, Msg.Play ) ->
            Down

        ( Model.Playing, _ ) ->
            Up

        ( Model.Paused, Msg.Play ) ->
            Down

        ( Model.Paused, Msg.Pause ) ->
            Down

        ( Model.Paused, _ ) ->
            Up

        ( Model.Stopped, _ ) ->
            Up

        ( Model.Ejected, Msg.Insert ) ->
            Down

        ( Model.Ejected, _ ) ->
            Up

        ( Model.Rewinding, Msg.Rewind ) ->
            Down

        ( Model.Rewinding, _ ) ->
            Up

        ( Model.FastForwarding, Msg.FastForward ) ->
            Down

        ( Model.FastForwarding, _ ) ->
            Up

        ( Model.Recording, Msg.Record ) ->
            Down

        ( Model.Recording, _ ) ->
            Up


type alias ButtonSpec =
    ( String, ( Int, Int ), List ( Int, Int ) )


btn :
    ButtonSpec
    -> ButtonSpec
    -> Model.Status
    -> Msg.Msg
    -> List (Html Msg.Msg)
btn up down =
    \status msg ->
        let
            f ( src, tl, target ) =
                [ Svg.image
                    [ Attributes.style
                        [ ( "pointer-events", "none" )
                        ]
                    , SvgAttributes.xlinkHref src
                    , SvgAttributes.transform (toTrans tl)
                    ]
                    []
                , Svg.polygon
                    [ SvgAttributes.points <| List.foldr (\( x, y ) s -> toString x ++ "," ++ toString y ++ " " ++ s) "" target
                    , SvgAttributes.style "fill:transparent"
                    , SvgAttributes.cursor "pointer"
                    , SvgAttributes.transform (toTrans tl)
                    , Events.onClick msg
                    ]
                    []
                ]

            toTrans ( top, left ) =
                "translate("
                    ++ toString left
                    ++ ","
                    ++ toString top
                    ++ ")"
        in
            f <|
                case btnMgr status msg of
                    Down ->
                        down

                    Up ->
                        up


upRect : List ( Int, Int )
upRect =
    [ ( 85, 0 ), ( 115, 28 ), ( 32, 75 ), ( 0, 36 ) ]


downRect : List ( Int, Int )
downRect =
    [ ( 70, 0 ), ( 115, 28 ), ( 32, 93 ), ( 0, 58 ) ]


view : Model.Model -> Html Msg.Msg
view { isCapable, status } =
    unsupported isCapable <|
        div
            [ Attributes.style
                [ ( "margin", "0 auto" )
                , ( "width", "950px" )
                , ( "position", "relative" )
                ]
            ]
            [ img [ Attributes.src "cold.jpg" ] []
            , div [ Attributes.style [ ( "position", "absolute" ), ( "left", "0" ), ( "top", "0 " ) ] ]
                [ Svg.svg
                    [ Attributes.height 794
                    , Attributes.width 950
                    ]
                  <|
                    btn
                        ( "btn/RUp.png", ( 287, 138 ), [ ( 85, 0 ), ( 115, 28 ), ( 32, 75 ), ( 0, 36 ) ] )
                        ( "btn/RDown.png", ( 285, 158 ), [ ( 85, 0 ), ( 115, 28 ), ( 32, 75 ), ( 0, 36 ) ] )
                        status
                        Msg.Record
                        ++ btn
                            ( "btn/RWUp.png", ( 311, 169 ), upRect )
                            ( "btn/RWDown.png", ( 316, 185 ), downRect )
                            status
                            Msg.Rewind
                        ++ btn
                            ( "btn/PlayUp.png", ( 342, 202 ), upRect )
                            ( "btn/PlayDown.png", ( 346, 215 ), downRect )
                            status
                            Msg.Play
                        ++ btn
                            ( "btn/PUp.png", ( 372, 238 ), upRect )
                            ( "btn/PDown.png", ( 377, 250 ), downRect )
                            status
                            Msg.Pause
                        ++ btn
                            ( "btn/FFUp.png", ( 404, 283 ), List.map (\( x, y ) -> ( x - 10, y + 5 )) upRect )
                            ( "btn/FFDown.png", ( 408, 289 ), downRect )
                            status
                            Msg.FastForward
                        ++ btn
                            ( "btn/SUp.png", ( 441, 311 ), List.map (\( x, y ) -> ( x + 10, y + 10 )) upRect )
                            ( "btn/SDown.png", ( 443, 325 ), List.map (\( x, y ) -> ( x + 10, y + 10 )) downRect )
                            status
                            Msg.StopEject
                        ++ btn
                            ( "cassette-down.png", ( 160, 326 ), [ ( 130, 0 ), ( 356, 165 ), ( 227, 236 ), ( 0, 53 ) ] )
                            ( "cassette-up.png", ( 161, 315 ), [ ( 0, 30 ), ( 300, 236 ), ( 356, 165 ), ( 130, 0 ) ] )
                            status
                            Msg.Insert
                ]
            ]
