module TEA.Components.Css.Packages exposing (..)

import Html exposing (Html)
import TEA.Components.Css as Css


bootstrap : Html msg
bootstrap =
    Css.link "https://cdn.rawgit.com/twbs/bootstrap/v4-dev/dist/css/bootstrap.css"


fontAwesome : Html msg
fontAwesome =
    Css.link "https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"
