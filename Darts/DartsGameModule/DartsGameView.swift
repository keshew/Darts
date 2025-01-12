import SwiftUI
import SpriteKit

struct DartsGameView: View {
    @StateObject var dartsGameModel =  DartsGameViewModel()
    @StateObject var gameModel =  DartsGameData()
    @ObservedObject var router: Router
    var body: some View {
        if gameModel.isLose {
            ZStack {
                SpriteView(scene: dartsGameModel.createDartsGameScene(gameData: gameModel))
                    .ignoresSafeArea()
                    .navigationBarBackButtonHidden(true)
                
                DartsLoseView(router: router)
            }
        } else if gameModel.isWin {
            ZStack {
                SpriteView(scene: dartsGameModel.createDartsGameScene(gameData: gameModel))
                    .ignoresSafeArea()
                    .navigationBarBackButtonHidden(true)
                
                DartsWinView(router: router)
            }
        } else {
            SpriteView(scene: dartsGameModel.createDartsGameScene(gameData: gameModel))
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    @ObservedObject var router = Router()
    return DartsGameView(router: router)
}

