module Main exposing (..)

import Browser
import Html exposing (Html, text, div, h1, img, button, li, ul, input)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)


---- MODEL ----


type alias Model = 
    {task : String
    , listTasks : List String}


init : ( Model, Cmd Msg )
init =
    ( {task = "", listTasks = []}, Cmd.none )



---- UPDATE ----


type Msg
    = NewTask String
    | SaveToList


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        NewTask newTask ->
            ( {model | task = newTask} , Cmd.none)
        SaveToList ->
            case model.task of
                "" ->
                    (model, Cmd.none)
                newTask ->
                    ( model
                            |> addTask newTask
                            |> clearSpace
                    ,   Cmd.none)                 

addTask : String -> Model -> Model
addTask newTask model= 
    {
        model | listTasks = (newTask :: model.listTasks)
            
    }


clearSpace model = 
    {model | task = ""}



---- VIEW ----

renderList : List String -> Html msg
renderList lst =
    lst
       |> List.map (\l -> li [] [ text l ])
       |> ul []

    
view : Model -> Html Msg
view model =
    div []
        [ input [placeholder "", value model.task, onInput NewTask] []
        , div [] [ renderList (model.listTasks)]
        , button [ onClick SaveToList][text "Save"]
        , input [type_ "checkbox"][]]
        



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }