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
        , Element.Background.color (Element.rgb255 230 230 250)
        , Element.width (Element.px 150)
        , Element.height (Element.px 150)
        ]
        box


box = Element.column
            -- these two centers the Element.text in div
            [ Element.centerX, Element.centerY ]
            [Element.text "Number of developers",
            Element.text "Average salary",
            Element.text "Unplanned work per unit time (%)"]
