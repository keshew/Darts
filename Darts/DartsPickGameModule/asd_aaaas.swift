import SwiftUI

struct asd_aaaas: View {
    @StateObject var dartsPickGameModel =  DartsPickGameViewModel()
    @ObservedObject var router: _RTR
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(.background)
                    .resizable()
                    .ignoresSafeArea()
                
                Image(.backgroundRectangle)
                    .resizable()
                    .frame(width: max(0, geometry.size.width - 1),
                           height: max(0, geometry.size.height * 0.24))
                    .position(x: geometry.size.width / 2,
                              y: geometry.size.height * 0.0001)
                VStack {
                    HStack {
                        _RR1(action: {
                            router.back()
                        }, imageForeground: DartsImageName.backArrow.rawValue,
                                    geometry: geometry)
                        
                        Spacer()
                        
                        Text("GAME")
                            ._SR(size: 42)
                            .padding(.trailing, geometry.size.width * 0.33)
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                    Spacer()
                    
                    VStack(spacing: 15) {
                        _PGB(geometry: geometry) {
                            router.showDarts()
                        }
                        
                        _PGB(imageForeground: DartsImageName.pointsEarnedIcon.rawValue,
                                       nameGame: "GRAB IT",
                                       geometry: geometry,
                                       offsetY: -10) {
                            router.showGrab()
                        }
                        
                        if dartsPickGameModel.isTimerRunning {
                            ZStack {
                                _PGB(imageForeground: DartsImageName.findIt.rawValue,
                                     nameGame: "FIND IT",
                                     geometry: geometry,
                                     offsetY: -5,
                                     sizeH: 0.148,
                                     sizeW: 0.24, offsetX: 0.22) {
                                    router.showFind()
                                    dartsPickGameModel.startTimer()
                                }
                                     .opacity(0.5)
                                
                                Text("\(dartsPickGameModel.formatTime(dartsPickGameModel.remainingTime))")
                                    ._SR(size: 30)
                                    .offset(x: 85, y: 40)
                            }
                        } else {
                            _PGB(imageForeground: DartsImageName.findIt.rawValue,
                                 nameGame: "FIND IT",
                                 geometry: geometry,
                                 offsetY: -5,
                                 sizeH: 0.148,
                                 sizeW: 0.24, offsetX: 0.22) {
                                router.showFind()
                                dartsPickGameModel.startTimer()
                            }
                        }
                    }
                    Spacer()
                }
            }
            .onAppear() {
                dartsPickGameModel.loadTimer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    @ObservedObject var router = _RTR()
    return asd_aaaas(router: router)
}

