import Html exposing (div, button, text, Html)
import Html.Events exposing (onClick)
import Html.Attributes exposing (style)
import StartApp.Simple exposing (start)
import Color exposing (rgb, Color)

import String

import Svg exposing (svg, rect)
import Svg.Attributes exposing (
  width,
  height,
  x,
  y,
  version,
  viewBox,
  fill,
  transform)

main =
  start {
    model  = init,
    view   = view,
    update = update
  }

type alias Model =
  {
    x : String,
    y : String
  }

init : Model
init =
  {
    x = "50",
    y = "50"
  }

toHex : Color -> String
toHex c =
  let
    ext = c.toRgb
  in
    String.fromList (List.map show, [ ext.r, ext.g, ext.b ])

view : Signal.Address Action -> Model -> Html
view address model =
  --div [ style [ ("width","500px"), ("height","500px") ] ]
  div [ ]
    [
      svg
        [
          version "1.1",
          x "0", y "0",
          viewBox "0 0 1000 1000"
        ]
        [
        rect
          [ fill (rgb 0, 0, 255), x model.x, y model.y, width "100", height "100"
          ]
          []
        ]
    ]



type Action = Increment | Decrement

update : Action -> Model -> Model
update action model =
  model
