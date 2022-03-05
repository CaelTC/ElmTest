module Main exposing (..)

import Browser
import Html exposing (Html, text, div, h1, img)
import Html.Attributes exposing (src)
import Html.Attributes exposing (placeholder)
import Html.Events exposing (onInput)
import Html exposing (input)
import Html.Attributes exposing (value)


---- MODEL ----


type alias Model = 
    {content : String
    , savedModel : List String}


init : Model
init =
     {content = ""
     , savedModel= [""]}



---- UPDATE ----


type Msg = Add String | Save String

update : Msg -> Model -> Model
update msg model=
    case msg of 
        Add newContent->
           {model | content = newContent } 
        Save newContent->
            newContent :: savedModel
---- VIEW


view : Model -> Html Msg
view model =
    div []
        [ img [ src "/logo.svg" ] []
        , input [placeholder "text to reverse",value model.content, onInput Add][], div [] [ text (model.content)]
        ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.sandbox
        { init = Model, view = view, update = update}
