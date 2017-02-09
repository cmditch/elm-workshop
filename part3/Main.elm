module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


query : String
query =
    "age"


age : Int
age =
    12


ageList : List Int
ageList =
    [ 29, 34, 99 ]


twoDList : List (List String)
twoDList =
    [ [ "Testing the" ], [ "Two Dimensional Array" ] ]



-- Type Annotations, Type Aliases, etc


type alias NestedTypes =
    { id : Int
    , name : String
    , stars : Float
    }


type alias Model =
    { query : String
    , results : List NestedTypes
    }


type alias Msg =
    { operation : String
    , data : Int
    }


pluralize : String -> String -> Int -> String \
pluralize singular plural quantity = \
    if quantity == 1 then \
        singular \
    else \
        plural \



--view : Model -> Html Msg
--view model =
--    button [ onClick { operation = "RESET", data = "all" } ]
--        [ text "Reset All" ]


initialModel =
    { query = "tutorial"
    , results =
        [ { id = 1
          , name = "TheSeamau5/elm-checkerboardgrid-tutorial"
          , stars = 66
          }
        , { id = 2
          , name = "grzegorzbalcerek/elm-by-example"
          , stars = 41
          }
        , { id = 3
          , name = "sporto/elm-tutorial-app"
          , stars = 35
          }
        , { id = 4
          , name = "jvoigtlaender/Elm-Tutorium"
          , stars = 10
          }
        , { id = 5
          , name = "sporto/elm-tutorial-assets"
          , stars = 7
          }
        ]
    }


elmHubHeader =
    header []
        [ h1 [] [ text "ElmHub" ]
        , span [ class "tagline" ] [ text "Like GitHub, but for Elm things." ]
        ]


view : Model -> Html Msg
view model =
    div [ class "content" ]
        [ elmHubHeader
        , ul [ class "results" ] (List.map viewSearchResult model.results)
        ]


viewSearchResult result =
    li []
        [ span [ class "star-count" ] [ text (toString result.stars) ]
        , a [ href ("https://github.com/" ++ result.name), target "_blank" ]
            [ text result.name ]
        , button
            -- TODO add an onClick handler that sends a DELETE_BY_ID msg
            [ class "hide-result", onClick { operation = "DELETE_BY_ID", data = result.id } ]
            [ text "X" ]
        ]


update : Msg -> Model -> Model
update msg model =
    if msg.operation == "DELETE_BY_ID" then
        { model | results = List.filter (\result -> result.id /= msg.data) model.results }
    else
        model


main =
    Html.beginnerProgram
        { view = view
        , update = update
        , model = initialModel
        }
