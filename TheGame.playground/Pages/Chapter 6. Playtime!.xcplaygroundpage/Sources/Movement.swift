import Foundation


extension Board {
    
    public func findObstacleClosestToPlayer(moving direction: Direction) {
        
        obstaclesInTheWay = obstacles.filter { (obstacle) -> Bool in
            return obstacle.isOnSameAxis(as: player, moving: direction)
                && obstacle.isInFront(of: player, moving: direction)
        }
        
        
        closestObstacle = obstaclesInTheWay.min { (lhs, rhs) -> Bool in
            let lhsDist = player.distance(from: lhs, moving: direction)
            let rhsDist = player.distance(from: rhs, moving: direction)
            return lhsDist < rhsDist
        }
    }
    
    
    func updatePlayersPositionAfter(moving direction: Direction) {
        guard let closestObstacle = self.closestObstacle else {
            return
        }
        
        player = .contiguous(to: closestObstacle, moving: direction)
    }
    
    func playerMoves(_ direction: Direction) {
        findObstacleClosestToPlayer(moving: direction)
        updatePlayersPositionAfter(moving: direction)
    }
}
