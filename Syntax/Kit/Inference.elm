module Syntax.Kit.Inference exposing (..)

{-

   Your goal is to write type annotations for these
   functions. The more general the annotation, the better.

-}


dread x =
    x // 0


poltergeist x z =
    case x of
        Just y ->
            "what" ++ y

        Nothing ->
            z


phantasm x =
    case x of
        1 :: 2 :: y ->
            Just y

        _ ->
            Nothing


ghoul x =
    case x of
        True ->
            Just

        False ->
            \y -> Nothing
