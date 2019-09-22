import Foundation

enum BoardSpaceType {
    case emptySpace, obstacle, obstaclesInTheWay, closestObstacle, finish, player, rowDelimiter
}

extension BoardSpaceType: CustomStringConvertible {
    public var description: String {
        switch self {
        case .emptySpace:
            return "◽️"
        case .obstacle:
            return "◾️"
        case .closestObstacle:
            return "✅"
        case .obstaclesInTheWay:
            return "✴️"
        case .finish:
            return "🏁"
        case .player:
            return "🐨"
        case .rowDelimiter:
            return "\n"
        }
    }
}

typealias BoardLinearRepresentation = [BoardSpaceType]

protocol Renderer {
    associatedtype Input
    associatedtype Output
    func render(input: Input) -> Output
}

struct EmojiRenderer: Renderer {
    
    func render(input: Board) -> String {
        var output = ""
        
        let linear = BoardParser(board: input).parsed()
        output = linear.reduce("", { (result, spaceType) -> String in
            return "\(result)\(spaceType.description)"
        })
        
        return output
    }
}

public struct BoardParser {
    
    let board: Board
    var representationRowWidth: Int {
        return board.size.width + 3
    }
    
    func parsed() -> BoardLinearRepresentation {
        let outputLength = representationRowWidth * (board.size.height + 2) - 1
        var output = BoardLinearRepresentation(repeating: .emptySpace, count: outputLength)
        
        board.obstacles.map(index(for:)).forEach { (index) in
            output[index] = .obstacle
        }
        
        board.obstaclesInTheWay.map(index(for:)).forEach { (index) in
            output[index] = .obstaclesInTheWay
        }
        
        for row in -1..<board.size.height {
            let delimeterIndex = index(for: Position(x: representationRowWidth - 2, y: row))
            output[delimeterIndex] = .rowDelimiter
        }
        
        output[index(for: board.player)] = .player
        output[index(for: board.finish)] = .finish
        board.closestObstacle.flatMap { output[index(for: $0)] = .closestObstacle }
        
        return output
    }
    
    func index(for position: Position) -> Int {
        return representationRowWidth * (position.y + 1) + position.x + 1
    }
}

extension Board: CustomStringConvertible {
    public var description: String {
        return EmojiRenderer().render(input: self)
    }
}

extension Board: CustomPlaygroundDisplayConvertible {
    public var playgroundDescription: Any {
        return description
    }
}
