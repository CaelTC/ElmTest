module Main exposing (..)

import Browser
import Html exposing (Html, text, div, h1, img, button)
import Html.Attributes exposing (placeholder, value, src)
import Html.Events exposing (onInput, onClick)
import Html exposing (input)
import Platform exposing (Task)
import Platform.Cmd exposing (none)



---- MODEL ----
type Status = InProgress
    | NotStarted
    | Done

type alias Tasks = 
    {name : String
    , id : Int
    , status : Status}
type alias Newtask =
    {name: String
    , id :Int
    , status : Status}


type alias Model = 
    {tasks : List Tasks
    , newTask : List Newtask}

listAjout : List Newtask
listAjout = 
    [
        {name = "dormir", id = 3, status = NotStarted}
    ]
listDepart : List Tasks
listDepart=
    [ 
        {name = "manger", id = 1, status = Done}
        , {name = "boire", id = 2, status = Done}
    ]
init : (Model, Cmd Msg)
init =
    ({tasks=listDepart, newTask=listAjout}, Cmd.none)



---- UPDATE ----


type Msg = None

update : Msg -> Tasks -> (Tasks, Cmd Msg)
update msg model=
    case msg of  
        None -> 
            ( {newTask :: tasks}, Cmd.none)  
            
       
    
        


--- VIEW


view : Model -> Html Msg
view model =
    div []
        [text "model.name"]
    div [] [button "TEST", onClick None]
        



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = none
        , subscriptions = always Sub.none
        }
