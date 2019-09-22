/*:
 [Previous](@previous) | [Next](@next)
 
 # Chapter 3. Functions and Loops
*/

func edgesForBoard(ofSize width: Int, by height: Int) -> [Position] {
    return horizontalEdgesForBoard(ofSize: width, by: height)
}


var obstacles = [Position(x: 0, y: 4),
                 Position(x: 1, y: 0),
                 Position(x: 3, y: 2)]

var board = Board(width: 4,
                  height: 5,
                  finish: Position(x: 1, y: 1),
                  obstacles: obstacles,
                  player: Position(x: 0, y: 2))

board


//: [Next](@next)
