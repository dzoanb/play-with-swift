import Foundation

extension Position {
    
    public func isOnSameAxis(as position: Position, moving direction: Direction) -> Bool {
        switch direction {
        case .left, .right:
            return self.y == position.y
        case .down, .up:
            return self.x == position.x
        }
    }
    
    public func isInFront(of position: Position, moving direction: Direction) -> Bool {
        switch direction {
        case .left:
            return position.x > self.x
        case .right:
            return position.x < self.x
        case .up:
            return position.y > self.y
        case .down:
            return position.y < self.y
        }
    }
    
    public func distance(from position: Position, moving direction: Direction) -> Int {
        if direction.horizontal {
            return abs(position.x - self.x)
        } else {
            return abs(position.y - self.y)
        }
    }
    
    public static func contiguous(to position: Position, moving direction: Direction) -> Position {
        switch direction {
        case .up: return Position(x: position.x, y: position.y + 1)
        case .down: return Position(x: position.x, y: position.y - 1)
        case .left: return Position(x: position.x + 1, y: position.y)
        case .right: return Position(x: position.x - 1, y: position.y)
        }
    }
}
