module Main exposing (..)

import Browser
import Html exposing (Html, Attribute, text, div, button, li, ul, input)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)


---- MODEL ----
type alias Tasks = 
    { 
        name : String
    ,   status : Bool
    }

type alias Model = 
    { tasks : Maybe String
    , listTasks : List Tasks}


init : ( Model, Cmd Msg )
init =
    ( { tasks = Nothing, listTasks = defaultTask}, Cmd.none )
defaultTask: List Tasks
defaultTask = 
    [
        {name = "test", status = True}
    ]


---- UPDATE ----


type Msg
    = NewTask String
    | SaveToList


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        NewTask newName ->
            ( {model | tasks = Just newName} , Cmd.none)
        SaveToList ->
            case model.tasks of
                Nothing ->
                    (model, Cmd.none)
                Just ""->
                    (model, Cmd.none)
                Just newName ->
                    ( 
                        model
                        |> addNew newName
                        |> clearField
                    ,   Cmd.none
                    )


addNew : String -> Model -> Model
addNew newName model = 
    { model
    | listTasks =
        {
            name = newName
        ,   status = True
        }
            :: model.listTasks
    }            

clearField model = 
    {model | tasks = Nothing}



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
