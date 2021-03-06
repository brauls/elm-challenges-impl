module Models exposing (..)

import RemoteData exposing (WebData)
import Challenges.Common.SnakeGame as SnakeGame

type alias Position = {
  x : Int,
  y : Int
}

type alias GithubUserSearch = {
  id : Int,
  search : String
}

type alias GithubUser = {
  avatarUrl : String,
  fetchReposUrl : String,
  name : String
}

type alias Model = {
  blueCircles : List Position,
  drawRandomCircles : Bool,
  githubUser : WebData GithubUser,
  githubUserLanguages : WebData (List (Maybe String)),
  githubUserSearch : GithubUserSearch,
  mousePosition : Position,
  route : Route,
  windowWidth : Int,
  windowHeight: Int,
  snakeModel: SnakeGame.Model
}

initialModel : Route -> Model
initialModel route =
  {
    blueCircles = [],
    drawRandomCircles = True,
    githubUser = RemoteData.NotAsked,
    githubUserLanguages = RemoteData.NotAsked,
    githubUserSearch = { id = -1, search = "" },
    mousePosition = { x = -1, y = -1 },
    route = route,
    windowWidth = -1,
    windowHeight = -1,
    snakeModel = SnakeGame.initialModel
  }

type Route
  = HomeRoute
  | Challenge1Route
  | Challenge2Route
  | Challenge3Route
  | Challenge4Route
  | Challenge5Route
  | NotFoundRoute

fetchGithubUserUrl : String -> String
fetchGithubUserUrl userName =
  "https://api.github.com/users/" ++ userName
