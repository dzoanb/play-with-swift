import Foundation

public protocol Scene: CustomStringConvertible, CustomPlaygroundDisplayConvertible {}


public class Completion: Scene {
    static let `default` = Completion(message: "")
    public let message: String
    
    init(message: String) {
        self.message = message
    }
    
    public var description: String {
        return EmojiCompletionRenderer().render(input: self)
    }
}


public class Game {
    public private(set) var scene: Scene
    let completion: Completion
    
    private init(board: Board, completion: Completion) {
        self.scene = board
        self.completion = completion
    }
    
    public static func start(withCompletionMessage completionMessage: String) -> Game {
        let board = Board(width: 4,
                          height: 5,
                          finish: Position(x: 1, y: 1),
                          obstacles: [Position(x: 0, y: 4), Position(x: 1, y: 0), Position(x: 3, y: 2)],
                          player: Position(x: 0, y: 2))
        return Game(board: board, completion: Completion(message: completionMessage))
    }
    
    public func move(_ direction: Direction) -> Game {
        switch scene {
        case let board as Board:
            board.playerMoves(direction)
            if board.player == board.finish {
                scene = completion
            }
            return self
        default:
            return Game.start(withCompletionMessage: completion.message)
        }
    }
}
