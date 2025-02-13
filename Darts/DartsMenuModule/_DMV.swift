import SwiftUI

struct _DMV: View {
    @StateObject var dartsMenuModel =  DMVM()
    @ObservedObject var router = _RTR()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            GeometryReader { geometry in
                ZStack {
                    Image(.menuBackground)
                        .resizable()
                        .ignoresSafeArea()
                    
                    VStack {
                        Image(.manWithBalls)
                            .resizable()
                            .frame(width: geometry.size.width * 0.69,
                                   height: geometry.size.height * 0.61)
                        
                        HStack(spacing: 5) {
                            VStack {
                                _0b1(action: {
                                    router.showOptions()
                                }, imageForeground: DartsImageName.gearForeground.rawValue,
                                             geometry: geometry)
                                
                                Text("options")
                                    ._SR(size: 22)
                            }
                            
                            VStack {
                                _0b1(action: {
                                    router.showStore()
                                }, imageForeground: DartsImageName.storeForeground.rawValue,
                                             geometry: geometry)
                                
                                Text("store")
                                    ._SR(size: 22)
                            }
                            
                            VStack {
                                _0b1(action: {
                                    router.showProgress()
                                }, imageForeground: DartsImageName.progressForeground.rawValue,
                                             geometry: geometry)

                                Text("progress")
                                    ._SR(size: 22)
                            }
                            
                            VStack {
                                _0b1(action: {
                                    router.showRules()
                                }, imageForeground: DartsImageName.rulesForeground.rawValue,
                                             geometry: geometry)
                                
                                Text("rules")
                                    ._SR(size: 22)
                            }
                        }
                        
                        Button(action: {
                            router.showPickGame()
                        }) {
                            ZStack {
                                Image(.backButtonBorder)
                                    .resizable()
                                    .frame(width: geometry.size.width * 0.688,
                                           height: geometry.size.height * 0.132)
                                
                                Text("PLAY")
                                    ._SR(size: 46, outlineWidth: 1.2)
                            }
                        }
                        .padding(.top)
                        .padding(.bottom)
                    }
                }
            }
            .navigationDestination(for: AppScreen.self) { screen in
                switch screen {
                case .options:
                    _DOV(router: router)
                case .store:
                    _DSV(router: router)
                case .progress:
                    _PDPASV(router: router)
                case .rules:
                    _21edsa_(router: router)
                case .pickGame:
                    asd_aaaas(router: router)
                case .lose:
                    qwesad(router: router)
                case .darts:
                    DGMASD(router: router)
                case .grab:
                    zxk9(router: router)
                case .find:
                    DartsFindView(router: router)
                }
            }
        }
    }
}

#Preview {
    _DMV()
}

