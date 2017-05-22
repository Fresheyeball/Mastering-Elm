module Syntax.OccationalPolymorphism exposing (..)

{-
   Weird magic polymorphism sometimes!

   In Elm lower case in type variables is generic.
   But, there are certain generic variable names that
   have magic special polymorhic properities.

   The types we can use with one of these variables,
   are set by the compiler, and cannot be modified
   or extended.

-}
{- appendable -}


sum_ : appendable -> List appendable -> appendable
sum_ =
    List.foldr (++)


concatList : List (List a) -> List a
concatList =
    sum_ []


concatString : List String -> String
concatString =
    sum_ ""



{- number -}


twenty : number
twenty =
    20


addTwenty : number -> number
addTwenty =
    (+) twenty


thirtyFloat : Float
thirtyFloat =
    30


fiftyFloat : Float
fiftyFloat =
    addTwenty thirtyFloat


fifteenInt : Int
fifteenInt =
    15


thirtyFiveInt : Int
thirtyFiveInt =
    addTwenty fifteenInt



{- comparable -}


between :
    comparable
    -> comparable
    -> comparable
    -> Bool
between x y z =
    x < z && z < y


betweenZeroAndTen : number -> Bool
betweenZeroAndTen =
    between 0 10


betweenAandD : Char -> Bool
betweenAandD =
    between 'a' 'd'


betweenYouAndMe : String -> Bool
betweenYouAndMe =
    between "you" "me"


betweenEmptyAndTrash : List Int -> Bool
betweenEmptyAndTrash =
    between [] [ 12, 12, 3, 4, 5 ]


betweenThingsAndStuff : ( String, Int ) -> Bool
betweenThingsAndStuff =
    between ( "foo", 32 ) ( "bar", 64 )
