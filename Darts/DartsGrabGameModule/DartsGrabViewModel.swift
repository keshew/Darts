import SwiftUI

class DartsGrabViewModel: ObservableObject {
    let contact = DartsGrabModel()
    
    func createDartsGrabGameScene(gameData: DartsGameDataGrab) -> DartsGrabGameSpriteKit {
        let scene = DartsGrabGameSpriteKit()
        scene.game  = gameData
        return scene
    }
}
