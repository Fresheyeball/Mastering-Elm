module Syntax.Complete.Inference exposing (..)

{-

   Your goal is to write type annotations for these
   functions. The more general the annotation, the better.

-}


dread : Int -> Int
dread x =
    x // 0


poltergeist : Maybe String -> String -> String
poltergeist x z =
    case x of
        Just y ->
            "what" ++ y

        Nothing ->
            z


phantasm : List number -> Maybe (List number)
phantasm x =
    case x of
        1 :: 2 :: y ->
            Just y

        _ ->
            Nothing


ghoul : Bool -> a -> Maybe a
ghoul x =
    case x of
        True ->
            Just

        False ->
            \y -> Nothing



{-
   Beloved,
   We wont last long with that thing chasing us, it just keeps
   changing like some poltergeist. We must develop further.
       -- <programmer name redacted>
-}
