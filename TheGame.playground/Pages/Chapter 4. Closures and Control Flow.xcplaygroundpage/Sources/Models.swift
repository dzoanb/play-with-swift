import Foundation

public struct Position {
    public let x: Int
    public let y: Int
    
    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

extension Position: Equatable {}

public enum Direction {
    case left
    case right
    case up
    case down

    public var horizontal: Bool {
        return self == .left || self == .right
    }
}

protocol MovableArea {
    func movePlayer(_ direction: Direction)
}

public class Board {
    public let size: (width: Int, height: Int)
    public let finish: Position
    public let obstacles: [Position]
    public var player: Position
    public var obstaclesInTheWay = [Position]()
    public var closestObstacle: Position?
    
    public init(width: Int, height: Int, finish: Position, obstacles: [Position], player: Position) {
        self.size = (width, height)
        self.finish = finish
        self.obstacles = obstacles //+ Board.edgesForBoard(width, by: height)
        self.player = player
    }
}

func edgesForBoard(_ width: Int, by height: Int) -> [Position] {
    var edgePositions = [Position]()

    for y in -1...height {
        edgePositions.append(Position(x: -1, y: y))
        edgePositions.append(Position(x: width, y: y))
    }

    for x in 0..<width {
        edgePositions.append(Position(x: x, y: -1))
        edgePositions.append(Position(x: x, y: height))
    }

    return edgePositions
}

private var obstacles = [Position(x: 0, y: 4), Position(x: 1, y: 0), Position(x: 3, y: 2)] + edgesForBoard(4, by: 5)
public var board = Board(width: 4, height: 5, finish: Position(x: 1, y: 1), obstacles: obstacles, player: Position(x: 0, y: 2))
