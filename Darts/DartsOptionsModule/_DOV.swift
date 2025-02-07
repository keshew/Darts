import SwiftUI

struct _DOV: View {
    @StateObject var dartsOptionsModel =  _DOVM()
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
                        
                        Text("OPTIONS")
                            ._SR(size: 42)
                            .padding(.trailing, geometry.size.width * 0.236)
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                    Spacer()
                    
                    VStack(spacing: 40) {
                        
                        HStack {
                            VStack(spacing: -10) {
                                _SN(imageForeground: DartsImageName.soundForeground.rawValue,
                                            sizeHImage: geometry.size.width * 0.217,
                                            sizeWImage: geometry.size.width * 0.217,
                                            offsetY: -geometry.size.height * 0.031,
                                            geometry: geometry)
                                
                                Text("sound")
                                    ._SR(size: 30)
                            }
                            
                            Spacer()
                            
                            ZStack {
                                _CS(value: $dartsOptionsModel.soundValue,
                                             range: 0...10,
                                             sizeSlider: geometry.size.width * 0.589)
                            }
                            .offset(y: -15)
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            VStack(spacing: -40) {
                                _SN(imageForeground: DartsImageName.musicForeground.rawValue,
                                            sizeHImage: geometry.size.width * 0.384,
                                            sizeWImage: geometry.size.width * 0.306,
                                            offsetY: -geometry.size.height * 0.053,
                                            geometry: geometry)
                                
                                Text("music")
                                    ._SR(size: 30)
                            }
                            
                            Spacer()
                            
                            ZStack {
                                _CS(value: $dartsOptionsModel.sliderValue,
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
    @ObservedObject var router = _RTR()
    return _DOV(router: router)
}

