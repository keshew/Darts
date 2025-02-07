import SwiftUI

struct _21edsa_: View {
    @StateObject var dartsRulesModel =  _A21sda()
    @ObservedObject var router: _RTR
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(.rulesBackground)
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
                        
                        Text("RULES")
                            ._SR(size: 42, firstColor: .white, secondColor: .purple)
                            .padding(.trailing, geometry.size.width * 0.31)
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                    Spacer()
                    
                    VStack(spacing: 5) {
                        HStack {
                            Text(dartsRulesModel.contact.arrayOfName[dartsRulesModel.currentIndex])
                                ._SR(size: 42)
                                .padding(.leading, 15)
                            Spacer()
                        }
                        
                        Text(dartsRulesModel.contact.arrayOfRules[dartsRulesModel.currentIndex])
                            ._SR(size: 30)
                            .minimumScaleFactor(0.8)
                            .frame(maxWidth: geometry.size.width * 0.915,
                                   maxHeight: geometry.size.height * 0.68,
                                   alignment: .top)
                    }
                    
                    HStack(spacing: 15) {
                        _RR1(action: {
                            dartsRulesModel.lowerIndex()
                        }, imageForeground: DartsImageName.backArrowCurly.rawValue,
                                    geometry: geometry,
                                    sizeBackgroundImage: 0.13,
                                    sizeWForegroundImage: 0.11,
                                    sizeHForegroundImage: 0.12)
                        .disabled(dartsRulesModel.currentIndex == 0 ? true : false)
                        
                        Text("\(dartsRulesModel.currentIndex + 1)/2")
                            ._SR(size: 24)
                        
                        _RR1(action: {
                            dartsRulesModel.increaseIndex()
                        }, imageForeground: DartsImageName.nextArrow.rawValue,
                                    geometry: geometry,
                                    sizeBackgroundImage: 0.13,
                                    sizeWForegroundImage: 0.11,
                                    sizeHForegroundImage: 0.12)
                        .disabled(dartsRulesModel.currentIndex == 1 ? true : false)
                    }
                    .padding(.bottom, 10)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    @ObservedObject var router = _RTR()
    return _21edsa_(router: router)
}

