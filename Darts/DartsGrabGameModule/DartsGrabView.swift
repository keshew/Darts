import SwiftUI
import SpriteKit

struct DartsGrabView: View {
    @StateObject var dartsGameModel =  DartsGrabViewModel()
    @StateObject var gameModel =  DartsGameDataGrab()
    @ObservedObject var router: Router
    var body: some View {
        if gameModel.isLose {
            ZStack {
                SpriteView(scene: dartsGameModel.createDartsGrabGameScene(gameData: gameModel))
                    .ignoresSafeArea()
                    .navigationBarBackButtonHidden(true)
                
                DartsGrabLoseView(router: router)
            }
        } else if gameModel.isWin {
            ZStack {
                SpriteView(scene: dartsGameModel.createDartsGrabGameScene(gameData: gameModel))
                    .ignoresSafeArea()
                    .navigationBarBackButtonHidden(true)
                
                DartsGrabWinView(router: router, winBonus: $gameModel.text)
            }
        } else {
            SpriteView(scene: dartsGameModel.createDartsGrabGameScene(gameData: gameModel))
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    @ObservedObject var router = Router()
    return DartsGrabView(router: router)
}
