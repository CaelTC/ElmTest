module Main exposing (..)

import Browser
import Html exposing (Html, Attribute, text, div, button, li, ul, input)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)


---- MODEL ----


type alias Model = 
    { tasks : String
    , listTasks : List String}


init : ( Model, Cmd Msg )
init =
    ( { tasks = "", listTasks = ["Test"]}, Cmd.none )



---- UPDATE ----


type Msg
    = NewTask String
    | SaveToList


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        NewTask newName ->
            ( {model | tasks = newName} , Cmd.none)
        SaveToList ->
            ( {model| listTasks = (model.tasks :: model.listTasks)}, Cmd.none)


---- VIEW ----

renderList : List String -> Html msg
renderList lst =
    lst
       |> List.map (\l -> li [] [ text l ])
       |> ul []

    
view : Model -> Html Msg
view model =
    div []
        [ input [placeholder "", value model.tasks, onInput NewTask] []
        , div [] [ renderList (model.listTasks)]
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
