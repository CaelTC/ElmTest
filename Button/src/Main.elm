module Main exposing (..)
import Array exposing (Array)
import Browser
import Html exposing (Html, text, div, h1, img, button, li, ul, input)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)


---- MODEL ----
type alias Task =
    { 
        name : String
    }

type alias Model = 
    {
        nameInput : String 
    ,   listTasks : Array Task
    }


init : ( Model, Cmd Msg )
init =
    ( {nameInput = "", listTasks = defaultTasks}, Cmd.none )

defaultTasks : Array Task
defaultTasks = 
    Array.fromList [
        {
            name = "Manger"
        }
    ]

---- UPDATE ----


type Msg
    = NameInput String
    | SaveToList String
    | Delete Int


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        NameInput newName ->
            ({model | nameInput = newName}, Cmd.none)   

        SaveToList newName->
            if String.isEmpty model.nameInput then
                    (model, Cmd.none)
                else
                    let
                        task = Task newName
                    in
                        ({model | listTasks = Array.push task model.listTasks}, Cmd.none)
       
        Delete id ->
            let
                updated = Array.append a1 a2
                a1 = Array.slice 0 id model.listTasks
                a2 = Array.slice (id+1) (Array.length model.listTasks) model.listTasks
            in
            ({model | listTasks = updated}, Cmd.none)
            






---- VIEW ----
renderTask : Int -> Task -> Html Msg
renderTask id task =
        li [] [text task.name, button [onClick (Delete id)][text "Done"] ]



renderList : Array Task -> Html Msg
renderList tasks =
        tasks
            |> Array.toList
            |> List.sortBy .name
            |> Array.fromList
            |> Array.indexedMap renderTask
            |> Array.toList
            |> ul []


    
view : Model -> Html Msg
view model =
    div []
        [ input [placeholder "", value model.nameInput, onInput NameInput] []
        , div [] [ renderList model.listTasks ]
        , button [ onClick <|SaveToList model.nameInput][text "Save"]
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