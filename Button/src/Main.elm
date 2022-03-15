module Main exposing (..)

import Browser
import Html exposing (Html, text, div, h1, img, button)
import Html.Attributes exposing (src)
import Html.Events exposing (onClick)


---- MODEL ----


type alias Model = 
    {number : Int
    , listNumber : List Int}


init : ( Model, Cmd Msg )
init =
    ( {number = 0, listNumber = []}, Cmd.none )



---- UPDATE ----


type Msg
    = Increment
    | Decrement
    | SaveToList


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            ( {model | number | number  = number + 1} , Cmd.none)
        Decrement ->
            ( {model | number | number = number - 1} , Cmd.none)
        SaveToList ->
            ( {model| listNumber |  listNumber = number :: listNumber}, Cmd.none)


---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Increment] [text "+"]
        , div [] [ text (String.fromInt model) ]
        , button [ onClick Decrement] [text "-"]
        , div [] [ text (List.map (model String.fromInt))]
        , button [ onClick SaveToList][text "Save"]]
    
        



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
