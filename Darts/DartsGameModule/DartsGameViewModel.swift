import SwiftUI

class DartsGameViewModel: ObservableObject {
    let contact = DartsGameModel()

    func createDartsGameScene(gameData: DartsGameData) -> DartsGameSpriteKit {
        let scene = DartsGameSpriteKit()
        scene.game  = gameData
        return scene
    }
}
