module Page.Home exposing (..)

import Html exposing (..)
import Html.Attributes exposing (href, rel)
import Url

import Css exposing (..)
import Session exposing (Session)


type alias Model =
    { message : String
    , session : Session
    }


type alias Msg =
    ()


init : Session -> ( Model, Cmd Msg )
init session =
    let
        model =
            { session = session
            , message = "/"
            }
    in
    (model, Cmd.none)


view : Model -> { title: String, content: Html msg }
view model =
    { title = "Welcome to kino.ma"
    , content = 
        div [ id Style "home-root", class Style "flex-container-center" ]
            [ h1 [ class Style "header" ] [ text "Welcome to kino.ma" ]
            , div []
                [ p [] [ text "Hello, this is kino.ma home page." ]
                ]
                , div [ class Style "card-tile-base"]
                    [ div [ class Style "card-tile" ]
                        [ h2 [] [ text "Links" ]
                        , aChild "https://twitter.kino.ma" [] "Twitter"
                        , aChild "https://mastodon.kino.ma/@makino" [rel "me"] "Mastodon" 
                        , aChild "https://github.com/kino-ma" [] "GitHub"
                        ]
                    , div [ class Style "card-tile"]
                        [ h2 [] [ text "hoge" ]
                        , text "fuga"
                        ]
                    , div [ class Style "card-tile"]
                        [ h2 [] [ text "hoge" ]
                        , text "fuga"
                        ]
                    , div [ class Style "card-tile"]
                        [ h2 [] [ text "hoge" ]
                        , text "fuga"
                        ]
                    , div [ class Style "card-tile"]
                        [ h2 [] [ text "hoge" ]
                        , text "fuga"
                        ]
                    , div [ class Style "card-tile"]
                        [ h2 [] [ text "hoge" ]
                        , text "fuga"
                        ]
                    , div [ class Style "card-tile"]
                        [ h2 [] [ text "hoge" ]
                        , text "fuga"
                        ]
                    , div [ class Style "card-tile"]
                        [ h2 [] [ text "hoge" ]
                        , text "fuga"
                        ]
                    , div [ class Style "card-tile"]
                        [ h2 [] [ text "hoge" ]
                        , text "fuga"
                        ]
                    , div [ class Style "card-tile"]
                        [ h2 [] [ text "hoge" ]
                        , text "fuga"
                        ]
                    ]
            , div [class Style "flex-container"]
                [ a [ href "https://github.com/kino-ma/www.kino.ma" ] [ text "page source" ]
                ]
            ]
    }


aChild : String -> List (Attribute msg) -> String -> Html msg
aChild link atrs content =
    a (atrs ++ [ class Style "me-link", href link ]) [ text content ]


toSession : Model -> Session
toSession model =
    model.session