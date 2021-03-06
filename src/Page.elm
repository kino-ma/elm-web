module Page exposing (..)

import Html exposing (..)
import Html.Attributes as Attr exposing (src)
import Browser exposing (Document)

import Css exposing (..)
import Session exposing (..)
import Route exposing (..)
import Html.Events


type Page
    = Home
    | AddContent
    | MovingMa
    | Other


type alias View msg = { title : String, content : Html msg, fullScreen : Bool }


view : Page -> View msg -> Document msg
view page { title, content, fullScreen } =
    { title = title
    , body =
        if fullScreen then
            [ content ]
        else
            [ viewHeader, content, viewFooter ]
    }

viewHeader : Html msg
viewHeader =
    header
        [ class Style "page-header-container" ]
        [ logo
        ]


headerMenuLink : List (Attribute msg) -> Route -> List (Html msg) -> Html msg
headerMenuLink attrs route =
    a <| attrs ++ [ href route ]


logo : Html msg
logo = 
    span [ class Style "page-header-logo-container"  ]
        [ headerMenuLink [] Route.Home
            [ img [ src "/logo.svg", class Style "page-header-logo", Attr.alt "logo of Hiragana MA" ] [] ]
        ]




hiddenMenu : List (Attribute msg) -> Html msg
hiddenMenu atrs = 
    headerMenuLink
        (atrs ++ [ class Style "hidden-menu" ])
        Route.AddContent
        [ text "add_content" ]


viewFooter : Html msg
viewFooter = 
    footer
        [ class Style "page-footer-container" ]
        [ small [class Style "flex-container"]
            [ span [ id Style "page-footer-copyright" ] [ text "2021 kino-ma" ]
            , a [ Attr.href "https://github.com/kino-ma/www.kino.ma", class Style "page-footer-source" ] [ text "page source" ]
            ]
        ]