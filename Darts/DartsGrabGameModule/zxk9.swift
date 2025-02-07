import SwiftUI
import SpriteKit

struct zxk9: View {
    @StateObject var dartsGameModel =  l01sa()
    @StateObject var gameModel =  dgdgmv()
    @ObservedObject var router: _RTR
    var body: some View {
        if gameModel.isLose {
            ZStack {
                SpriteView(scene: dartsGameModel.createDartsGrabGameScene(gameData: gameModel))
                    .ignoresSafeArea()
                    .navigationBarBackButtonHidden(true)
                
                kads9(router: router)
            }
        } else if gameModel.isWin {
            ZStack {
                SpriteView(scene: dartsGameModel.createDartsGrabGameScene(gameData: gameModel))
                    .ignoresSafeArea()
                    .navigationBarBackButtonHidden(true)
                
                jghmnvjf(router: router, winBonus: $gameModel.text)
            }
        } else {
            SpriteView(scene: dartsGameModel.createDartsGrabGameScene(gameData: gameModel))
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    @ObservedObject var router = _RTR()
    return zxk9(router: router)
}
