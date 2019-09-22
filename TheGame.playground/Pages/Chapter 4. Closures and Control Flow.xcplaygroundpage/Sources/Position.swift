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
}
