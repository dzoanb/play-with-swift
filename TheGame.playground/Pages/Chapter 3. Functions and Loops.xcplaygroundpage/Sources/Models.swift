import Foundation

public struct Position {
    public let x: Int
    public let y: Int
    
    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

public func horizontalEdgesForBoard(ofSize width: Int, by height: Int) -> [Position] {
  var edgePositions = [Position]()
  for x in -1...width {
    edgePositions.append(Position(x: x, y: -1))
    edgePositions.append(Position(x: x, y: height))
  }
  return edgePositions
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

public class Board {
    public let size: (width: Int, height: Int)
    public let finish: Position
    public let obstacles: [Position]
    public var player: Position
    
    
    public init(width: Int, height: Int, finish: Position, obstacles: [Position], player: Position) {
        self.size = (width, height)
        self.finish = finish
        self.obstacles = obstacles
        self.player = player
    }
}
