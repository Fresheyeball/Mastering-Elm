module Ghost.Advice
    exposing
        ( bloodyMary
        , flyingDutchman
        , anneBoleyn
        , theHitchiker
        , advice
        , compareGhosts
        , Ghost
        )

{-|
## Advice for dealing with Ghosts

@docs Ghost, advice

## The ghosts we know absolute

@docs bloodyMary, flyingDutchman, anneBoleyn, theHitchiker

## Ghosts may be compared

@docs compareGhosts

-}


{-| An ADT of known ghosts
-}
type Ghost
    = BloodyMary
    | FlyingDutchman
    | AnneBoleyn
    | TheHitchiker


{-| -}
bloodyMary : Ghost
bloodyMary =
    BloodyMary


{-| -}
flyingDutchman : Ghost
flyingDutchman =
    FlyingDutchman


{-| -}
anneBoleyn : Ghost
anneBoleyn =
    AnneBoleyn


{-| -}
theHitchiker : Ghost
theHitchiker =
    TheHitchiker


{-| get useful advice for dealing with a given ghost
-}
advice : Ghost -> String
advice ghost =
    case ghost of
        BloodyMary ->
            """
            Avoid chanting into mirrors.
            If you are spotted, run, it is your only hope.
            Do not run if ghost takes form of beverage, as it is not the ghost.
            """

        FlyingDutchman ->
            """
            Offering some alcohol will disarm.
            Do not engage in combat. Generally not aggressive if left alone.
            Do not display modern technology.
            """

        AnneBoleyn ->
            """
            Engaging in conversation will disarm.
            Avoid mentioning King Henry at all costs.
            Ignore her relationship advice.
            """

        TheHitchiker ->
            """
            Drive by. If you have already picked up the hitchiker,
            stop at the nearest diner. Ensure all passengers
            enter the diner with you.
            """


{-| Compare ghosts for general scaryness
-}
compareGhosts : Ghost -> Ghost -> Order
compareGhosts g g_ =
    case ( g, g_ ) of
        ( BloodyMary, _ ) ->
            GT

        ( FlyingDutchman, BloodyMary ) ->
            LT

        ( FlyingDutchman, AnneBoleyn ) ->
            GT

        ( FlyingDutchman, TheHitchiker ) ->
            GT

        ( AnneBoleyn, BloodyMary ) ->
            LT

        ( AnneBoleyn, FlyingDutchman ) ->
            LT

        ( AnneBoleyn, TheHitchiker ) ->
            GT

        ( TheHitchiker, _ ) ->
            LT

        _ ->
            EQ
