module Main exposing (..)

import Browser
import Element exposing (Element)
import Element.Background as Background
import Element.Border as Border
import Element.Input as Input
import Html exposing (Html)

type Model = Model Float

type Msg = UpdateWage Float



main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }

initialModel = Model 30000

view : Model -> Html Msg
view (Model wage) =
    Element.layout []
        (calculator wage)

update : Msg-> Model -> Model
update msg _ = case msg of
    UpdateWage newWage -> Model newWage

calculator : Float -> Element Msg
calculator wage =
    Element.column
        [ Element.centerX
        , Element.centerY
        , Element.padding 40
        , Element.spacing 40
        , Background.color (Element.rgb255 230 230 250)
        ]
        [ title, box wage, approximation ]


title =
    Element.text "Uppskatta kostnaden för er tekniska skuld"


box wage =
    --let
    --    avgWage =
    --        Element.text "Snittlön (kr)"
    --in
    Element.column
        -- these two centers the Element.text in div
        [ Element.centerX, Element.centerY ]
        [ Element.text "Antal utvecklare"
        , avgWage wage
        , Element.text "Uppskattad fördelning buggar/omskrivning (%)*"
        , Element.text "Uppskattad kostnad teknisk skuld (per månad)"
        ]


approximation =
    Element.text "Mycket pengar"

avgWage : Float -> Element Msg
avgWage wage =
    Input.slider
        [ Element.height (Element.px 30)

        -- Here is where we're creating/styling the "track"
        , Element.behindContent
            (Element.el
                [ Element.width Element.fill
                , Element.height (Element.px 2)
                , Element.centerY
                , Background.color (Element.rgb255  0 0 250)
                , Border.rounded 2
                ]
                Element.none
            )
        ]
        { onChange = UpdateWage
        , label =
            Input.labelAbove []
                (Element.text ("Genomsnittslön (per månad): " ++ (String.fromFloat wage)))
        , min = 20000
        , max = 75000
        , step = Just 2500
        , value = wage
        , thumb =
            Input.defaultThumb
        }