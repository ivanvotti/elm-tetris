module Tetromino exposing (Tetromino, toForm, iForm)

import Collage exposing (..)
import Color exposing (Color)


-- BLOCK


type alias Block =
    { color : Color
    }


blockSize : Float
blockSize =
    25


blockToForm : Block -> Form
blockToForm block =
    let
        shape =
            square blockSize

        fillColor =
            block.color

        borderColor =
            Color.black
    in
        group
            [ shape |> filled fillColor
            , shape |> outlined (solid borderColor)
            ]



-- TETROMINO


type alias Location =
    ( Float, Float )


type alias Tetromino =
    { shape : List Location
    , block : Block
    }


toForm : Tetromino -> Form
toForm { shape, block } =
    let
        blockForm =
            blockToForm block

        translate ( row, col ) =
            blockForm
                |> move ( col * blockSize, row * blockSize )
    in
        shape
            |> List.map translate
            |> group


iForm : Form
iForm =
    let
        block =
            Block Color.yellow

        shape =
            [ ( 0, 0 )
            , ( 1, 0 )
            , ( 2, 0 )
            , ( 3, 0 )
            ]
    in
        Tetromino shape block
            |> toForm
