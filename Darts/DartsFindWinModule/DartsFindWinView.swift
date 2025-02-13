import SwiftUI

struct DartsFindWinView: View {
    @StateObject var dartsFindWinModel =  DartsFindWinViewModel()
    @ObservedObject var router: _RTR
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    ZStack {
                        Image(.winMan)
                            .resizable()
                            .frame(width: geometry.size.width * 0.84,
                                   height: geometry.size.height * 0.54)
                            .offset(y: -geometry.size.height * 0.34)
                        
                        Image(.backForEndGame)
                            .resizable()
                            .frame(width: geometry.size.width * 0.8,
                                   height: geometry.size.height * 0.72)
                        
                        Text("WIN!")
                            ._SR(size: geometry.size.height * 0.1,
                                       outlineWidth: 2.3)
                            .offset(y: -geometry.size.height * 0.22)
                        
                        ZStack {
                            Image(.moneyBackground)
                                .resizable()
                                .frame(width: geometry.size.width * 0.38,
                                       height: geometry.size.height * 0.1)

                            Image(.coin)
                                .resizable()
                                .frame(width: geometry.size.width * 0.12,
                                       height: geometry.size.width * 0.12)
                                .offset(x: -geometry.size.width * 0.1)

                            Text("+50")
                                ._SR(size: geometry.size.height * 0.05,
                                           outlineWidth: 0.8,
                                           firstColor: .yellow,
                                           secondColor: .yellow)
                                .offset(x: geometry.size.width * 0.05)
                        }
                        .offset(y: -geometry.size.height * 0.075)
                        
                        HStack(spacing: 10) {
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
                        .offset(y: geometry.size.height * 0.075)
                        
                        Button(action: {
                            router.showPickGame()
                        }) {
                            ZStack {
                                Image(.backButtonBorder)
                                    .resizable()
                                    .frame(width: geometry.size.width * 0.53,
                                           height: geometry.size.height * 0.11)
                                Text("GO BACK")
                                    ._SR(size: geometry.size.height * 0.05,
                                               outlineWidth: 1)
                            }
                        }
                        .offset(y: geometry.size.height * 0.23)
                    }
                }
                .padding(.bottom, 10)
            }
        }
    }
}

#Preview {
    @ObservedObject var router = _RTR()
    return DartsFindWinView(router: router)
}

