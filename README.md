# Triomino

This game is a simulation of the game Triomino.

## How to use

```
Mouse:
    Left-click:   place/replace tile
    Right-click:  new tile
    Mouse-wheel:  rotate tile

Keyboard:
    left arrow:   rotate tile left
    right arrow:  rotate tile right
    space:        new tile
    D:            turn debug mode on/off
```

## Rules

You can place tiles, which are in a shape of a triangle. Each tile has three numbers on it, one on each corner. The numbers are diplayed as points and can be any number between 0 and 5. If you placed a tile, you will get a new one from the set. In order to place another tile, the new tile must fit to at least one placed tile. This means the new tile must be placed right next to another tile and the two adjacent numbers must be the same. If your current tile can not be placed, you need to get a new one. In the top left corner you can see the number of the remaining tiles from the set. You can also replace already placed tiles. Therefor just click on the tile you want to replace. Then place the tile on a new spot. You won the game when you placed all tiles.

## Installing

These instructions will get you a copy of the project up and running on your local machine for playing and testing purposes.

If you want to use this code you need [Processing 3](https://processing.org/).
Just download this project and open it in Processing. Click the play button to start the application.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
