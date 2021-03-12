module Main exposing (..)

import Element exposing (Element)
import Element.Background
import Html exposing (Html)


main : Html msg
main =
    Element.layout []
        -- layout converts from Element to Html
        calculator


calculator : Element a
calculator =
    Element.el
        [ Element.centerX -- these two centers the div
        , Element.centerY
        , Element.padding 40
        , Element.Background.color (Element.rgb255 230 230 250)
        ]
        box


box =
    Element.column
        -- these two centers the Element.text in div
        [ Element.centerX, Element.centerY ]
        [ Element.text "Number of developers"
        , Element.text "Average salary (per month)"
        , Element.text "Unplanned work per unit time (%)"
        , Element.text "Approximate cost of technical debt (per month)"
        ]
