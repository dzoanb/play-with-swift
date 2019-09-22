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
}
