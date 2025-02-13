import SwiftUI

struct qwesad: View {
    @StateObject var dartsLoseModel =  ads12()
    @ObservedObject var router: _RTR
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    ZStack {
                        Image(.loseMan)
                            .resizable()
                            .frame(width: geometry.size.width * 0.54,
                                   height: geometry.size.height * 0.3)
                            .offset(y: -geometry.size.height * 0.46)
                        
                        Image(.backForEndGame)
                            .resizable()
                            .frame(width: geometry.size.width * 0.8,
                                   height: geometry.size.height * 0.72)
                        
                        Text("LOSE!")
                            ._SR(size: geometry.size.height * 0.1,
                                       outlineWidth: 2.3)
                            .offset(y: -geometry.size.height * 0.22)
                        
                        
                        Text("Continue for coins")
                            ._SR(size: geometry.size.height * 0.02,
                                       outlineWidth: 0.5)
                            .offset(y: -geometry.size.height * 0.075)
                        
                        Button(action: {
                            
                        }) {
                            ZStack {
                                Image(.backButtonBorder)
                                    .resizable()
                                    .frame(width: geometry.size.width * 0.53,
                                           height: geometry.size.height * 0.11)
                                Text("BUY")
                                    ._SR(size: geometry.size.height * 0.05,
                                               outlineWidth: 1)
                                    .offset(x: -geometry.size.width * 0.1)
                                
                                ZStack {
                                    Image(.moneyBackground)
                                        .resizable()
                                        .frame(width: geometry.size.width * 0.19,
                                               height: geometry.size.height * 0.05)
                                    
                                    Image(.heart)
                                        .resizable()
                                        .frame(width: geometry.size.width * 0.07,
                                               height: geometry.size.height * 0.04)
                                        .offset(x: -geometry.size.width * 0.042)
                                    
                                    Text("X3")
                                        ._SR(size: geometry.size.height * 0.028,
                                                   outlineWidth: 0.8)
                                        .offset(x: geometry.size.width * 0.034)
                                }
                                .offset(x: geometry.size.width * 0.1)
                                
                                ZStack {
                                    Image(.costMoneyBackground)
                                        .resizable()
                                        .frame(width: geometry.size.width * 0.11,
                                               height: geometry.size.height * 0.031)
                                        .offset(x: geometry.size.width * 0.129)
                                    
                                    Image(.coin)
                                        .resizable()
                                        .frame(width: geometry.size.width * 0.04,
                                               height: geometry.size.height * 0.02)
                                        .offset(x: geometry.size.width * 0.105)
                                    
                                    Text("45")
                                        ._SR(size: 9,
                                                   firstColor: .white,
                                                   secondColor: .orange)
                                        .offset(x: geometry.size.width * 0.146)
                                }
                                .offset(x: geometry.size.width * 0.08,
                                        y: geometry.size.height * 0.04)
                            }
                        }
                        .disabled(true)
                        
                        HStack(spacing: 20) {
                            Button(action: {
                                router.showDarts()
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
    return qwesad(router: router)
}

