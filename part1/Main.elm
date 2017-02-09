module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


main =
    div [ class "content" ]
        [ header []
            [ h1 [] [ text "ElmHub" ]
            , span
                [ class "tagline" ]
                [ text "Like Github, but for elmish things" ]
            ]
        ]


record =
    { name = "thing", x = 1, y = 1 }
