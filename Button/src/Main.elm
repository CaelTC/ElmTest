module Main exposing (..)

import Browser
import Html exposing (Html, text, div, h1, img, button, li, ul)
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


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Increment ->
            ( {model | number  = model.number + 1} , Cmd.none)
        Decrement ->
            ( {model | number = model.number - 1} , Cmd.none)
        SaveToList ->
            ( {model| listNumber = (model.number :: model.listNumber)}, Cmd.none)


---- VIEW ----

renderList : List String -> Html msg
renderList lst =
    lst
       |> List.map (\l -> li [] [ text l ])
       |> ul []

    
view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Increment] [text "+"]
        , div [] [ text (String.fromInt model.number) ]
        , button [ onClick Decrement] [text "-"]
        , div [] [ renderList (List.map String.fromInt model.listNumber)]
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
