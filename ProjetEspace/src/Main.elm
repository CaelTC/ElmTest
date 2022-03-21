module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


---- MODEL ----


type alias Model =
    {textTotest : String}


init : ( Model, Cmd Msg )
init =
    ( {textTotest = "M"}, Cmd.none )



---- UPDATE ----


type Msg
    = Test String
    | Analyse String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of 
        Test newText ->
            ({model | textTotest = newText}, Cmd.none)



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ input [ placeholder "Écrivez votre texte"] []
        ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
