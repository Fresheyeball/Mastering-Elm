-- TODO: Do not export Ghost constructors


module Ghost.Advice exposing (..)

-- TODO: Write documenation comment with @docs keyword
-- TODO: Document all exports
-- TODO: Expose this module


type Ghost
    = BloodyMary
    | FlyingDutchman
    | AnneBoleyn
    | TheHitchiker


bloodyMary : Ghost
bloodyMary =
    BloodyMary


flyingDutchman : Ghost
flyingDutchman =
    FlyingDutchman


anneBoleyn : Ghost
anneBoleyn =
    AnneBoleyn


theHitchiker : Ghost
theHitchiker =
    TheHitchiker


advice : Ghost -> String
advice ghost =
    case ghost of
        BloodyMary ->
            """
            Avoid chanting into mirrors.
            If you are spotted, run, it's your only hope.
            Do not run if ghost takes form of beverage, as it's not the ghost.
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
