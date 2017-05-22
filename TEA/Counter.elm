module TEA.Counter exposing (..)

import Html exposing (program)
import Html.Events
import Html.Attributes


-- Count is the one and only Msg that
-- will flow through the counter.


type Count
    = Count



-- Knocks is the Model of the counter.


type alias Knocks =
    Int


main : Program Never Knocks Count
main =
    program
        -- Our intiial count of Knocks is 0, and we have no side effects.
        { init =
            ( 0, Cmd.none )
            -- Each time we recieve a Count we increment Knocks
            -- and have no side effects.
        , update =
            \Count knocks -> ( knocks + 1, Cmd.none )
            -- Html is determined by Knocks
        , view =
            \knocks ->
                Html.div
                    [ Html.Attributes.style
                        [ ( "padding", "20px" ) ]
                    ]
                    [ Html.h3 []
                        [ Html.text ("Knocks: " ++ toString knocks) ]
                    , Html.button
                        -- Upon clicking on the button
                        -- we send Count to the runtime.
                        [ Html.Events.onClick Count ]
                        [ Html.text "Count" ]
                    ]
            -- No subscriptions
        , subscriptions = \knocks -> Sub.none
        }
