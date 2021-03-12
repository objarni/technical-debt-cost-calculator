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
        calculator

update : Msg-> Model -> Model
update msg _ = case msg of
    UpdateWage newWage -> Model newWage

calculator : Element Msg
calculator =
    Element.column
        [ Element.centerX
        , Element.centerY
        , Element.padding 40
        , Element.spacing 40
        , Background.color (Element.rgb255 230 230 250)
        ]
        [ title, box, approximation ]


title =
    Element.text "Uppskatta kostnaden för er tekniska skuld"


box =
    --let
    --    avgWage =
    --        Element.text "Snittlön (kr)"
    --in
    Element.column
        -- these two centers the Element.text in div
        [ Element.centerX, Element.centerY ]
        [ Element.text "Antal utvecklare"
        , avgWage
        , Element.text "Uppskattad fördelning buggar/omskrivning (%)*"
        , Element.text "Uppskattad kostnad teknisk skuld (per månad)"
        ]


approximation =
    Element.text "Mycket pengar"

avgWage =
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
                (Element.text "Genomsnittslön (per månad)")
        , min = 20000
        , max = 75000
        , step = Just 2500
        , value = 25000
        , thumb =
            Input.defaultThumb
        }