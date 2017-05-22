module SanityCheck exposing (..)

import Syntax.Playground
import Syntax.OccationalPolymorphism
import Syntax.Kit.Inference
import Syntax.Complete.Inference
import Syntax.TrickShots
import TEA.Kit.EMF
import TEA.Complete.EMF
import TEA.Complete.EMF0
import TEA.Kit.Happenings
import TEA.Complete.Happenings
import TEA.Counter


x : Int
x =
    Debug.crash "Dear God. Just tell me it all compiles."
