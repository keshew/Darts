import SwiftUI

struct DartsGrabWinView: View {
    @StateObject var DartsGrabWinModel =  DartsGrabWinViewModel()
    @ObservedObject var router: Router
    @Binding var winBonus: String
    
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
                        
                        Text("WIN!")
                            .SpicyRice(size: geometry.size.height * 0.1,
                                       outlineWidth: 2.3)
                            .offset(y: -geometry.size.height * 0.22)
                        
                        ZStack {
                            Image(.backButton)
                                .resizable()
                                .frame(width: geometry.size.width * 0.27,
                                       height: geometry.size.height * 0.08)

                            Text("SCORE")
                                .SpicyRice(size: geometry.size.height * 0.03,
                                           outlineWidth: 0.8,
                                           firstColor: .purple,
                                           secondColor: .pink)
                                .offset(y: -10)
                            
                            Text("X\(winBonus)")
                                .SpicyRice(size: geometry.size.height * 0.03,
                                           outlineWidth: 0.8,
                                           firstColor: .purple,
                                           secondColor: .pink)
                                .offset(y: 12)
                        }
                        .offset(y: geometry.size.height * -0.1)
                        
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

                            Text("+\((Int(winBonus) ?? 1) * 10)")
                                .SpicyRice(size: geometry.size.height * 0.045,
                                           outlineWidth: 0.8,
                                           firstColor: .yellow,
                                           secondColor: .yellow)
                                .offset(x: geometry.size.width * 0.05)
                        }
                        .offset(y: geometry.size.height * 0.03)
                        
                        HStack(spacing: 10) {
                            Button(action: {
                                router.showGrab()
                            }) {
                                ZStack {
                                    Image(.roundBackground)
                                        .resizable()
                                        .frame(width: geometry.size.width * 0.23,
                                               height: geometry.size.width * 0.23)
                                    
                                    Image(.retry)
                                        .resizable()
                                        .frame(width: geometry.size.width * 0.135,
                                               height: geometry.size.width * 0.135)
                                }
                            }

                            Button(action: {
                                router.showPickGame()
                                UserDefaultsManager().completeLevel(countOfMoney: (Int(winBonus) ?? 1) * 10)
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
    @State var winBonus = ""
    @ObservedObject var router = Router()
    return DartsGrabWinView(router: router, winBonus: $winBonus)
}

