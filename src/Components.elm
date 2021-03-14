module Components exposing (..)
import Element exposing (Element)
import Element.Background as Background
import Element.Border as Border
import Element.Input as Input
import Model exposing (..)

sliderElement : (Int -> Msg) -> String -> Int -> Int -> Int -> Int -> Element Msg
sliderElement updateFn text value step minValue maxValue =
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
                (Element.text text)
        , min = toFloat minValue
        , max = toFloat maxValue
        , step = Just (toFloat step)
        , value = toFloat value
        , thumb =
            Input.defaultThumb
        }
