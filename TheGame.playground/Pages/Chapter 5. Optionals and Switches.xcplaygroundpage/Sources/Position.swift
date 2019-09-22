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
    
    // snippet
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
        switch direction {
        case .left, .right: return abs(position.x - self.x)
        case .down, .up: return abs(position.y - self.y)
        }
    }
}
