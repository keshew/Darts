import SwiftUI

struct DartsOptionsView: View {
    @StateObject var dartsOptionsModel =  DartsOptionsViewModel()
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
                        
                        Text("OPTIONS")
                            .SpicyRice(size: 42)
                            .padding(.trailing, geometry.size.width * 0.236)
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                    Spacer()
                    
                    VStack(spacing: 40) {
                        
                        HStack {
                            VStack(spacing: -10) {
                                SoundButton(imageForeground: DartsImageName.soundForeground.rawValue,
                                            sizeHImage: geometry.size.width * 0.217,
                                            sizeWImage: geometry.size.width * 0.217,
                                            offsetY: -geometry.size.height * 0.031,
                                            geometry: geometry)
                                
                                Text("sound")
                                    .SpicyRice(size: 30)
                            }
                            
                            Spacer()
                            
                            ZStack {
                                CustomSlider(value: $dartsOptionsModel.soundValue,
                                             range: 0...10,
                                             sizeSlider: geometry.size.width * 0.589)
                            }
                            .offset(y: -15)
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            VStack(spacing: -40) {
                                SoundButton(imageForeground: DartsImageName.musicForeground.rawValue,
                                            sizeHImage: geometry.size.width * 0.384,
                                            sizeWImage: geometry.size.width * 0.306,
                                            offsetY: -geometry.size.height * 0.053,
                                            geometry: geometry)
                                
                                Text("music")
                                    .SpicyRice(size: 30)
                            }
                            
                            Spacer()
                            
                            ZStack {
                                CustomSlider(value: $dartsOptionsModel.sliderValue,
                                             range: 0...10,
                                             sizeSlider: geometry.size.width * 0.589)
                            }
                            .offset(y: -0)
                        }
                        .padding(.horizontal)
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
    return DartsOptionsView(router: router)
}

