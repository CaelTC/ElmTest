module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


---- MODEL ----


type alias Model =
    {
      textTotest : String
    , passedTest : Bool
    }


init : ( Model, Cmd Msg )
init =
    ( {textTotest = "123", passedTest = True}, Cmd.none )



---- UPDATE ----


type Msg
    = Write String
    | Verify


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of 
        Write newText ->
            ({model | textTotest = newText}, Cmd.none)
        Verify ->
                let 
                    newText = String.endsWith " " (model.textTotest)
                in 
                 if
                    newText == False
                        then 
                            ({model | passedTest = False}, Cmd.none)
                else
                    ({model | passedTest = True}, Cmd.none)



---- VIEW ----
result : Model -> String
result model =   
    case model.passedTest of 
        True ->
            "Votre mot de passe fini par un ESPACE. CHANGER LE AU PLUS VITE"
        False ->
            "Mot de passe accepté"

view : Model -> Html Msg
view model =
    div [] [ input [ placeholder "Écrivez votre texte", onInput Write][]
    , h1 [] [text (result model)]
    , button [onClick Verify ] [text "Vérifier"]
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
