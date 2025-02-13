import SwiftUI

struct DartsFindLoseView: View {
    @StateObject var dartsFindLoseModel =  DartsFindLoseViewModel()
    @ObservedObject var router: _RTR
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                
                VStack {
                    ZStack {
                        Image(.backForEndGame)
                            .resizable()
                            .frame(width: geometry.size.width * 0.8,
                                   height: geometry.size.height * 0.72)
                        
                        Text("LOSE")
                            ._SR(size: geometry.size.height * 0.1,
                                       outlineWidth: 2.3)
                            .offset(y: -geometry.size.height * 0.22)
                        
                        Text("You didn't guess\nwhere the ball was ")
                            ._SR(size: geometry.size.height * 0.03,
                                       outlineWidth: 0.5)
                            .frame(width: 230, height: 100)
                            .multilineTextAlignment(.center)
                            .minimumScaleFactor(0.8)
                            .offset(y: -geometry.size.height * 0.015)
                        
                        HStack(spacing: 20) {
                            Button(action: {
                                router.showPickGame()
                            }) {
                                ZStack {
                                    Image(.roundBackground)
                                        .resizable()
                                        .frame(width: geometry.size.width * 0.23,
                                               height: geometry.size.width * 0.23)
                                    
                                    Image(.menuFromLose)
                                        .resizable()
                                        .frame(width: geometry.size.width * 0.107,
                                               height: geometry.size.width * 0.107)
                                }
                            }
                        }
                        .offset(y: geometry.size.height * 0.19)
                    }
                }
                .padding(.bottom, 10)
            }
        }
    }
}

#Preview {
    @ObservedObject var router = _RTR()
    return DartsFindLoseView(router: router)
}

