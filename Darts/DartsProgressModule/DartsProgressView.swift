import SwiftUI

struct DartsProgressView: View {
    @StateObject var dartsProgressModel =  DartsProgressViewModel()
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
                        
                        Text("PROGRESS")
                            .SpicyRice(size: 42, firstColor: .white, secondColor: .purple)
                            .padding(.trailing, geometry.size.width * 0.2)
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                    Spacer()
                    
                    VStack(spacing: geometry.size.height * 0.092) {
                        ProgressLabel(geometry: geometry,
                                      label1: "DARTS",
                                      label2: "12/5",
                                      label3: "WINS/LOSSES")
                
                        
                        ProgressLabel(geometry: geometry,
                                      label1: "GRAB IT",
                                      label2: "450",
                                      label3: "POINTS EARNED",
                                      image: DartsImageName.pointsEarnedIcon.rawValue)
                    }
                    .padding(.bottom, geometry.size.height * 0.119)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    @ObservedObject var router = Router()
    return DartsProgressView(router: router)
}

