module TEA.Kit.Happenings.Model exposing (..)

import Time exposing (Time)


{-

   This is a union type representing the
   different `Happening`s that might take place
   in the dead of night.

-}


type Happening
    = Knocks Knocks
    | Coldspot
    | Floating Object



-- TODO: Add more happenings


type NewHappening
    = NewKnocks
    | NewColdspot
    | NewFloating



{-

   This is a type just like `Happening`, except it
   has only one constructor. This is useful, as the type system will
   prevent us from confusing Objects with regular old Strings

-}


type Object
    = Object String



{-

   These are type aliases. In this case,
   they serve no purpose other than to
   make our types more readable.

-}


type alias Knocks =
    Int


type alias Record =
    ( Happening, Time )



{-

   This is the main Model of our application.

   ALL STATE WILL BE DOCUMENTED BY THIS TYPE.

   This is our one and only source of truth for the state of
   an Elm application. If we need a value to change over time,
   it will appear on this type in some way.

   The Model is a record (which is kind of like an object).
   Learn more about record syntax http://elm-lang.org/docs/records

-}


type alias Model =
    { records :
        List Record
        -- TODO: wireup dropdown
    , annotation : String
    }



-- This is the initial state of our application.


init : Model
init =
    { records =
        []
        -- TODO: wireup dropdown
    , annotation = ""
    }
