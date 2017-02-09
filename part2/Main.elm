module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


pluralize singular plural quantity =
    if quantity == 1 then
        singular
    else
        plural


pluralizeLeaves =
    pluralize "leaf" "leaves"


model =
    { result =
        { id = 1
        , name = "TheSeamau5/elm-checkerboardgrid-tutorial"
        , stars = 66
        }
    }


main =
    let
        elmHubHeader =
            header []
                [ h1 [] [ text "ElmHub" ]
                , span [ class "tagline" ] [ text "Like GitHub, but for Elm things." ]
                ]
    in
        div [ class "content" ]
            [ elmHubHeader
            , ul [ class "results" ]
                [ li []
                    [ span [ class "star-count" ] [ text (toString model.result.stars) ]
                    , a [ href ("https://github.com/" ++ model.result.name) ] [ text model.result.name ]
                    , p [] [ text ("lots of " ++ pluralizeLeaves 10 ++ " or one " ++ pluralizeLeaves 1) ]
                    ]
                ]
            ]
