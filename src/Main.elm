module Main exposing (..)

import Browser
import Components exposing (sliderElement)
import Element exposing (Element)
import Element.Background as Background
import Html exposing (Html)
import Model exposing (..)


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }


initialModel =
    TechDebtData { numberOfDevs = 3, averageWage = 30000 }


view : Model -> Html Msg
view (TechDebtData data) =
    Element.layout []
        (calculator data)


update : Msg -> Model -> Model
update msg (TechDebtData data) =
    case msg of
        UpdateWage newWage ->
            TechDebtData { data | averageWage = newWage }

        UpdateDevs newDevsCount ->
            TechDebtData { data | numberOfDevs = newDevsCount }


calculator data =
    Element.column
        [ Element.centerX
        , Element.centerY
        , Element.padding 40
        , Element.spacing 40
        , Background.color (Element.rgb255 230 230 250)
        ]
        [ title, box data.numberOfDevs data.averageWage, approximation ]


title =
    Element.text "Uppskatta kostnaden för er tekniska skuld"


box devs wage =
    Element.column
        [ Element.centerX, Element.centerY ]
        [ numDevs devs
        , avgWage wage
        , Element.text "Uppskattad fördelning buggar/omskrivning (%)*"
        , Element.text "Uppskattad kostnad teknisk skuld (per månad)"
        ]


approximation =
    Element.text "Mycket pengar"


numDevs : Int -> Element Msg
numDevs devCount =
    sliderElement UpdateDevs
        { text = "Antal utvecklare: " ++ String.fromInt devCount
        , value = devCount
        , step = 1
        , minValue = 3
        , maxValue = 12
        }


avgWage : Int -> Element Msg
avgWage wage =
    sliderElement UpdateWage
        { text = "Genomsnittslön (per månad): " ++ String.fromInt wage
        , value = wage
        , step = 2500
        , minValue = 20000
        , maxValue = 75000
        }
