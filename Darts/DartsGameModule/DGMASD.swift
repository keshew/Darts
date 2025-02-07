import SwiftUI
import SpriteKit

struct DGMASD: View {
    @StateObject var dartsGameModel =  _asd21()
    @StateObject var gameModel =  ga()
    @ObservedObject var router: _RTR
    var body: some View {
        if gameModel.isLose {
            ZStack {
                SpriteView(scene: dartsGameModel.createDartsGameScene(gameData: gameModel))
                    .ignoresSafeArea()
                    .navigationBarBackButtonHidden(true)
                
                qwesad(router: router)
            }
        } else if gameModel.isWin {
            ZStack {
                SpriteView(scene: dartsGameModel.createDartsGameScene(gameData: gameModel))
                    .ignoresSafeArea()
                    .navigationBarBackButtonHidden(true)
                
                asd21(router: router)
            }
        } else {
            SpriteView(scene: dartsGameModel.createDartsGameScene(gameData: gameModel))
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    @ObservedObject var router = _RTR()
    return DGMASD(router: router)
}

