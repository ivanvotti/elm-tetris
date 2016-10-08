module Main exposing (main)

import Html exposing (Html)
import Collage
import Element
import Tetromino exposing (Tetromino)


main : Html msg
main =
    let
        ( collageWidth, collageHeight ) =
            ( 600, 600 )
    in
        [ Tetromino.iForm ]
            |> Collage.collage collageWidth collageHeight
            |> Element.toHtml
