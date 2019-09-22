/*:
 [Previous](@previous) | [Next](@next)
 # Chapter 4. Closures and Control Flow
*/

extension Board {
  
    func playerMoves(_ direction: Direction) {
        findObstacleClosestToPlayer(moving: direction)
    }


    func findObstacleClosestToPlayer(moving direction: Direction) {

        obstaclesInTheWay = obstacles.filter { (obstacle) -> Bool in
            return obstacle.isOnSameAxis(as: player, moving: direction)
                && obstacle.isInFront(of: player, moving: direction)
        }
    }
}

board.playerMoves(.right)

//: [Next](@next)
