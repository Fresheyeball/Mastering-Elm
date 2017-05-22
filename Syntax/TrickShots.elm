module Syntax.TrickShots exposing (..)


type Onzy
    = Onzy Int String


unOnzy : Onzy -> Int
unOnzy (Onzy x s) =
    x + String.length s



-- Onzy pattern match


tupledPatternMatch : Maybe Int -> Maybe Int -> Int
tupledPatternMatch x y =
    case ( x, y ) of
        ( Just a, Just b ) ->
            a + b

        ( Just a, _ ) ->
            a

        ( _, Just b ) ->
            b

        _ ->
            0


debugViaLet : Int -> Int
debugViaLet x =
    let
        _ =
            Debug.log <| "x was: " ++ toString x
    in
        x * 354654



-- currying and zipping with comma


curryNZip : a -> List b -> List c -> List ( a, b, c )
curryNZip x =
    List.map2 ((,,) x)
