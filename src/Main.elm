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
    TechDebtData
        { numberOfDevs = 3
        , averageWage = 30000
        , unplannedPercent = 50
        }


view : Model -> Html Msg
view model =
    Element.layout []
        (calculator model)


update : Msg -> Model -> Model
update msg (TechDebtData data) =
    case msg of
        UpdateWage newWage ->
            TechDebtData { data | averageWage = newWage }

        UpdateDevs newDevsCount ->
            TechDebtData { data | numberOfDevs = newDevsCount }

        UpdateUnplanned newUnplanned ->
            TechDebtData { data | unplannedPercent = newUnplanned }


calculator (TechDebtData data as model) =
    Element.column
        [ Element.centerX
        , Element.centerY
        , Element.padding 40
        , Element.spacing 60
        , Background.color (Element.rgb255 230 230 250)
        ]
        [ title, inputBox data.numberOfDevs data.averageWage data.unplannedPercent, approximation model]


title =
    Element.text "Uppskatta kostnaden för er tekniska skuld"

--A2*B2*(C2-15)/100
approximation : Model -> Element msg
approximation (TechDebtData data) =
    let
        a2 = data.numberOfDevs
        b2 = data.averageWage
        c2 = data.unplannedPercent
        cost = 12 * a2*b2*(c2 - 15)//100
    in
    Element.column []
        [ Element.text "💸 Uppskattad kostnad per år.\nExtra jämfört med ett high performing team"
        , Element.text (String.fromInt cost ++ "kr")
        ]


inputBox devs wage unplanned =
    Element.column
        [ Element.centerX, Element.centerY, Element.spacing 40 ]
        [ numDevs devs
        , avgWage wage
        , avgUnplanned unplanned
        ]


numDevs : Int -> Element Msg
numDevs devCount =
    sliderElement UpdateDevs
        { text = "👩‍💻 Antal utvecklare\n" ++ String.fromInt devCount
        , value = devCount
        , step = 1
        , minValue = 3
        , maxValue = 12
        }


avgWage : Int -> Element Msg
avgWage wage =
    sliderElement UpdateWage
        { text = "💰 Genomsnittslön (per månad)\n" ++ String.fromInt wage
        , value = wage
        , step = 2500
        , minValue = 20000
        , maxValue = 125000
        }


avgUnplanned : Int -> Element Msg
avgUnplanned unplanned =
    let txt =  ("😳 Tid (%) för buggar/brandsläckning/förseningar.\n" ++
                "Ett high performing team har 15%\n")
    in
    sliderElement UpdateUnplanned
        { text = txt ++ String.fromInt unplanned
        , value = unplanned
        , step = 5
        , minValue = 15
        , maxValue = 90
        }
