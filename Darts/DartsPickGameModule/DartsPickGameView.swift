import SwiftUI

struct DartsPickGameView: View {
    @StateObject var DartsPickGameModel =  DartsPickGameViewModel()
    @ObservedObject var router: Router
    
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
                        RoundButton(action: {
                            router.back()
                        }, imageForeground: DartsImageName.backArrow.rawValue,
                                    geometry: geometry)
                        
                        Spacer()
                        
                        Text("GAME")
                            .SpicyRice(size: 42)
                            .padding(.trailing, geometry.size.width * 0.33)
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                    Spacer()
                    
                    VStack(spacing: 15) {
                        PickGameButton(geometry: geometry) {
                            router.showDarts()
                        }
                        
                        PickGameButton(imageForeground: DartsImageName.pointsEarnedIcon.rawValue,
                                       nameGame: "GRAB IT",
                                       geometry: geometry,
                                       offsetY: -10) {
                            router.showGrab()
                        }
                    }
                    Spacer()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    @ObservedObject var router = Router()
    return DartsPickGameView(router: router)
}

