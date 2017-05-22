{-
    Comments
-}

-- a single line comment

{- a multiline comment
   {- can be nested -}
-}

{-
    Modules
-}

module Syntax.Playground exposing (..)

-- qualified imports
-- import List                    -- List.map, List.foldl
-- import List as L               -- L.map, L.foldl
--
-- -- open imports
-- import List exposing (..)               -- map, foldl, concat, ...
-- import List exposing ( map, foldl )     -- map, foldl
--
-- import Maybe exposing ( Maybe )         -- Maybe
-- import Maybe exposing ( Maybe(..) )     -- Maybe, Just, Nothing
-- import Maybe exposing ( Maybe(Just) )   -- Maybe, Just
-- Qualified imports are preferred. Module names must match their file name, so module Parser.Utils needs to be in file Parser/Utils.elm.

-- Here's a handy trick that every Elm programmer should know:
{--}
add : number -> number -> number
add x y = x + y
--}

{-
    Literals
-}

true : Bool
true = True

false : Bool
false = False

fortyTwo : number -- Int or Float depending on usage
fortyTwo = 42

pie : Float
pie = 3.14

a : Char
a = 'a'

abc : String
abc = "abc"

-- type annotations are optional, but recommended for all top level declarations
-- multilineString : String
multilineString = """
    The EMF meter is going crazy.
    Something is wrong. Something feels very wrong.
    Dakota no! You don't know what's in there!
"""

-- Typical manipulation of literals:

someBool : Bool
someBool = True && not (True || False)

someNum : number
someNum = (2 + 4) * (4^2 - 9)

someString : String
someString = "abc" ++ "def"

{-
    Lists
-}

-- Here are three things that are equivalent:
simpleList : List Int
simpleList = [1,2,3,4]

listViaCons : List Int
listViaCons = 1 :: [2,3,4]

listViaConses : List Int
listViaConses = 1 :: 2 :: 3 :: 4 :: []

{-
    Conditionals
-}

sayan : Int -> String
sayan powerLevel = if powerLevel > 9000 then "OVER 9000!!!" else "meh"

-- If you need to branch on many different conditions, you just chain this construct together.
keyness : Int -> Int -> Int
keyness n key = if key == 40 then
        n + 1
    else if key == 38 then
        n - 1
    else
        n

-- You can also have conditional behavior based on the structure of algebraic data types and literals
unwrapMaybeList : Maybe (List a) -> List a
unwrapMaybeList maybe =
    case maybe of
        Just xs -> xs
        Nothing -> []

headTailList : List a -> Maybe (a, List a)
headTailList xs =
    case xs of
        hd::tl -> Just (hd,tl)
        []     -> Nothing

fib : Int -> Int
fib n =
    case n of
        0 -> 1
        1 -> 1
        _ -> fib (n-1) + fib (n-2)

-- Each pattern is indentation sensitive, meaning that you have to align all of your patterns.

{-
    Union Types
-}

type OurList a = OurEmpty | OurNode a OurList
-- Not sure what this means? Read this. https://guide.elm-lang.org/types/union_types.html

{-
    Records
-}
-- For more explanation of Elm’s record system, see this overview http://elm-lang.org/docs/records

-- create a record
point : {x:Int,y:Int}
point =
  { x = 3, y = 4 }

-- access field
pointX : Int
pointX = point.x

-- accessors are also functions
pointY : Int
pointY = .y point

-- field access function
xsFromPointList : List Int
xsFromPointList = List.map .x [point,{x=0,y=0}]

-- update a field
updatedPoint : {x:Int,y:Int}
updatedPoint = { point | x = 6 }

-- update many fields
updatedPointMany : {x:Int,y:Int}
updatedPointMany =
    { point |
        x = point.x + 1,
        y = point.y + 1
    }

-- pattern matching on fields
dist : {x:Float,y:Float} -> Float
dist {x,y} =
  sqrt (x^2 + y^2)

-- type aliases for records
type alias Location =
  { line : Int
  , column : Int
  }

{-
    Functions
-}

square : Float -> Float
square n = n^2

hypotenuse : Float -> Float -> Float
hypotenuse a b =
  sqrt (square a + square b)

distance : (Float, Float) -> (Float, Float) -> Float
distance (a,b) (x,y) =
  hypotenuse (a - x) (b - y)

-- Anonymous functions:
square_ : Float -> Float
square_ = \n -> n^2

squares : List Int
squares =
  List.map (\n -> n^2) (List.range 1 100)

-- These are all equivalent
takesTwo                 : number -> number -> number
takesTwo             x y = x + x + y
takesTwoViaLambda        : number -> number -> number
takesTwoViaLambda      x = \y -> x + x + y
takesTwoViaLambdaWithTwo : number -> number -> number
takesTwoViaLambdaWithTwo = \x y -> x + x + y
takesTwoViaLambdas       : number -> number -> number
takesTwoViaLambdas       = \x -> \y -> x + x + y

{-
    Infix Operators
-}

-- You can create custom infix operators.
(?) : Maybe a -> a -> a
(?) maybe default =
  Maybe.withDefault default maybe

-- Precedence goes from 0 to 9, where 9 is the tightest. The default precedence is 9 and the default associativity is left. You can set this yourself, but you cannot override built-in operators.
infixr 9 ?

-- Use (<|) and (|>) to reduce parentheses usage. They are aliases for function application.
viewNames1 : List String -> String
viewNames1 names =
  String.join ", " (List.sort names)

viewNames2 : List String -> String
viewNames2 names =
  names
    |> List.sort
    |> String.join ", "

-- (arg |> func) is the same as (func arg)
-- Just keep repeating that transformation!
-- Historical note: this is borrowed from F#, inspired by Unix pipes.

-- Relatedly, (<<) and (>>) are function composition operators.

-- The following are also equivalent
viewNames3 : List String -> String
viewNames3 names = names |> List.sort >> String.join ", "
viewNames4 : List String -> String
viewNames4 names = List.sort names |> String.join ", "
viewNames5 : List String -> String
viewNames5 names = (List.sort >> String.join ", ") names
viewNames6 : List String -> String
viewNames6 = List.sort >> String.join ", "

{-
    Let Expressions
-}

-- Let expressions are for assigning variables, kind of like a var in JavaScript.
numViaLet : number
numViaLet = let
    twentyFour =
      3 * 8

    sixteen =
      4 ^ 2
  in
    twentyFour + sixteen

-- You can define functions and use “destructuring assignment” in let expressions too.
numViaLetWithDestructing : Float
numViaLetWithDestructing = let
    ( three, four ) =
      ( 3, 4 )

    hypotenuse a b =
      sqrt (a^2 + b^2)
  in
    hypotenuse three four

-- Let-expressions are indentation sensitive, so each definition must align with the one above it.

-- Finally, you can add type annotations in let-expressions.
hermann : Int
hermann = let
    accidentalVoicemail : String
    accidentalVoicemail =
      """
      Dr. Hermann! Whats up? Long time no see.
      Mysterious force? What are you talking about?
      Come have a cup of tea.
      Stop shaking.
      """

    increment : Int -> Int
    increment n =
      n + 1
  in
    increment 10

-- It is best to only do this on concrete types. Break generic functions into their own top-level definitions.

{-
    Applying Functions
-}

-- alias for appending lists and two lists
append : List a -> List a -> List a
append xs_ ys_ = xs_ ++ ys_

xs : List Int
xs = [1,2,3]

ys : List Int
ys = [4,5,6]

-- All of the following expressions are equivalent:
a1 : List Int
a1 = append xs ys
a2 : List Int
a2 = xs ++ ys
b2 : List Int
b2 = (++) xs ys
c1 : List Int
c1 = (append xs) ys
c2 : List Int
c2 = ((++) xs) ys

-- The basic arithmetic infix operators all figure out what type they should have automatically.

-- addedNumber : number
addedNumber = 23 + 19
-- addedFloat : Float
addedFloat = 2.0 + 1
-- multipliedNumber : number
multipliedNumber = 6 * 7
-- multipliedFloat : Float
multipliedFloat = 10 * 4.2
-- dividedInt : Int
dividedInt = 100 // 2
-- dividedFloat : Float
dividedFloat = 1 / 2

-- There is a special function for creating tuples:
tuplize : a -> b -> (a,b)
tuplize = (,)

-- All of these are equivalent
tupedViaPrefix : (Int,Int)
tupedViaPrefix = (,) 1 2
tupedViaInfix : (Int,Int)
tupedViaInfix = (1,2)
tupedViaCurryPrefix : (Int,Int)
tupedViaCurryPrefix = ((,) 1) 2

-- You can use as many commas as you want.
tuped3ViaPrefix : (Int,Bool,Char,List a)
tuped3ViaPrefix = (,,,) 1 True 'a' []
tuped3ViaInfix : (Int,Bool,Char,List a)
tuped3ViaInfix = (1,True,'a',[])


{-
    Type Aliases
-}

type alias Name = String
type alias Age = Int

info : (Name,Age)
info =
  ("Steve", 28)

type alias Point = { x:Float, y:Float }

origin : Point
origin =
  { x = 0, y = 0 }
-- Learn more about type aliases here. https://guide.elm-lang.org/types/type_aliases.html

{-
    JavaScript Interop
-}

-- For `port prices` and `port time` to compile,
-- you will need to add `port` to the module
-- declaration at the top of this file, so it reads
-- port module Syntax.Playground exposing (..)

-- incoming values
-- port prices : (Float -> msg) -> Sub msg

-- outgoing values
-- port time : Float -> Cmd msg

-- From JS, you talk to these ports like this:

{-
    var app = Elm.Example.worker();

    app.ports.prices.send(42);
    app.ports.prices.send(13);

    app.ports.time.subscribe(callback);
    app.ports.time.unsubscribe(callback);
-}
