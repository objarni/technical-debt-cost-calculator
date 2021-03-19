module Components exposing (..)

import Element exposing (Element)
import Element.Background as Background
import Element.Border as Border
import Element.Input as Input
import Model exposing (..)


type alias SliderParameters =
    { text : String
    , value : Int
    , step : Int
    , minValue : Int
    , maxValue : Int
    }


sliderElement : (Int -> Msg) -> SliderParameters -> Element Msg
sliderElement updateFn params =
    let
        actualUpdateFn x =
            updateFn (round x)
    in
    Input.slider
        [ Element.height (Element.px 30)
        , Element.behindContent
            (Element.el
                [ Element.width Element.fill
                , Element.height (Element.px 5)
                , Element.centerY
                , Background.color (Element.rgb255 0 0 150)
                , Border.rounded 2
                ]
                Element.none
            )
        ]
        { onChange = actualUpdateFn
        , label =
            Input.labelAbove []
                (Element.text params.text)
        , min = toFloat params.minValue
        , max = toFloat params.maxValue
        , step = Just (toFloat params.step)
        , value = toFloat params.value
        , thumb =
            Input.defaultThumb
        }
