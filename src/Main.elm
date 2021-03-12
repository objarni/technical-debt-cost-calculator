module Main exposing (..)

import Element exposing (Element)
import Element.Background
import Html exposing (Html)


main : Html msg
main =
    Element.layout []
        calculator


calculator : Element a
calculator =
    Element.column
        [ Element.centerX
        , Element.centerY
        , Element.padding 40
        , Element.spacing 40
        , Element.Background.color (Element.rgb255 230 230 250)
        ]
        [ title, box, approximation ]


title =
    Element.text "Uppskatta kostnaden för er tekniska skuld"


box =
    Element.column
        -- these two centers the Element.text in div
        [ Element.centerX, Element.centerY ]
        [ Element.text "Antal utvecklare"
        , Element.text "Snittlön (kr)"
        , Element.text "Uppskattad fördelning buggar/omskrivning (%)*"
        , Element.text "Uppskattad kostnad teknisk skuld (per månad)"
        ]


approximation =
    Element.text "Mycket pengar"
