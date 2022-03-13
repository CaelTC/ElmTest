module Main exposing (..)

import Browser
import Html exposing (Html, text, div, h1, img, button)
import Html.Attributes exposing (src)
import Html.Events exposing (onClick)


---- MODEL ----


type alias Model = 
    {number : List String}


init : ( Model, Cmd Msg )
init =
    ( 
       {
        number=
    [
    "1",
    "2",
    "3"
    ]
        }
    , Cmd.none 
    )



---- UPDATE ----


type Msg 
    =NoOp 
   -- Increment 
   -- | Decrement
    --| SaveToList


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of 
        NoOp ->
            (model, Cmd.none)
        --Increment ->
            --( model + 1 , Cmd.none)
       -- Decrement->
            --( model - 1 , Cmd.none)
       -- SaveToList newNumber ->
           -- ( newNumber :: listNumber, Cmd.none)


---- VIEW ----
numberItem : List String -> String -> Html Msg
numberItem liste = 
    div []
        [text (List.map liste)]

view : Model -> Html Msg
view model =
   div [] [numberItem model.number]
    
        



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
