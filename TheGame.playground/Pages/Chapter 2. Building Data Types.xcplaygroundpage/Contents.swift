/*:
 [Previous](@previous) | [Next](@next)
 
 # Chapter 2. Building Data Types
 */

import Foundation

enum Direction {
    case left
    case right
    case up
    case down
}

//: ![Board](board.png)
class Board {
    let size: (width: Int, height: Int)
    let obstacles: [Position]
    var player: Position
    
  
    init(width: Int, height: Int, obstacles: [Position], start: Position) {
        self.size = (width, height)
        self.obstacles = obstacles
        self.player = start
    }
}


var obstacles = [Position(x: 0, y: 4),
                 Position(x: 1, y: 0),
                 Position(x: 3, y: 2)]

var board = Board(width: 4,
                  height: 5,
                  obstacles: obstacles,
                  start: Position(x: 0, y: 2))

//: [Next](@next)
