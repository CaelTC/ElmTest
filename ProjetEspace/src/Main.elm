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
    ( {textTotest = "12345", passedTest = False}, Cmd.none )



---- UPDATE ----


type Msg
    = Test String
    | Count String Bool


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of 
        Test newText ->
            ({model | textTotest = newText}, Cmd.none)
        Count newText ewText ->
                let 
                    text = String.length (model.textTotest)
                        ewText = text <= 5
                in 
                    if testText == True
                        then ({model | passedTest = True} ,Cmd.none)
                    else 
                        ({model | passedTest = False}, Cmd.none)



---- VIEW ----
result : Model -> String
result model =   
    case model.passedTest of 
        True ->
            "Passed"
        False ->
            "Not passed"

view : Model -> Html Msg
view model =
    div [] [ input [ placeholder "Écrivez votre texte"][]
    , h1 [] [text (result model)]
    , button [onClick (Count (model.textTotest) (model.passedTest))] [text "Vérifier"]]
    
    
    
    
        
---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
