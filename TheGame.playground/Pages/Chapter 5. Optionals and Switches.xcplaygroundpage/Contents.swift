/*:
 [Previous](@previous) | [Next](@next)
 # Chapter 5. Switches and Optionals
 */

extension Position {
    static func contiguous(to position: Position, moving direction: Direction) -> Position {
        switch direction {
        case .up:
            return Position(x: position.x, y: position.y + 1)
            
        case .down:
            return Position(x: position.x, y: position.y - 1)
            
        case .left:
            return Position(x: position.x + 1, y: position.y)
            
        case .right:
            return Position(x: position.x - 1, y: position.y)
        }
    }
}

extension Board {
        
    func playerMoves(_ direction: Direction) {
        findObstacleClosestToPlayer(moving: direction)
        updatePlayersPositionAfter(moving: direction)
    }
    
    
    func updatePlayersPositionAfter(moving direction: Direction) {
    }
}

board.playerMoves(.right)

//: [Next](@next)
