module RequestView (render) where

import CategoryView
import Actions exposing (Action)
import Html.Events exposing (onClick)
import Request exposing (Request)
import Sprite
import Category


render : Signal.Address Action -> (Float, Float) -> Request -> List Sprite.Box
render address position request =
  case request of
    Request.Return _ article data ->
      CategoryView.render position [] article.category ++
      if data.blinkHidden then
        CategoryView.render
          position
          [onClick address (Actions.ClickArticle article)]
          Category.Return
      else
        []

    Request.Order _ category data ->
      CategoryView.render
        position
        [onClick address (Actions.ClickCategory category)]
        (if data.blinkHidden then category else Category.Placeholder)