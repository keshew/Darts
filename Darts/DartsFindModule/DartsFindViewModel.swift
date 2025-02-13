import SwiftUI

class DartsFindViewModel: ObservableObject {
    let contact = DartsFindModel()

    func createFindGameScene(gameData: GameModel) -> FindGameView {
        let scene = FindGameView()
        scene.game  = gameData
        return scene
    }
}
