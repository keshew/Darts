import SwiftUI

struct DartsMenuView: View {
    @StateObject var dartsMenuModel =  DartsMenuViewModel()
    @ObservedObject var router = Router()
    
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
                                SimpleButton(action: {
                                    router.showOptions()
                                }, imageForeground: DartsImageName.gearForeground.rawValue,
                                             geometry: geometry)
                                
                                Text("options")
                                    .SpicyRice(size: 22)
                            }
                            
                            VStack {
                                SimpleButton(action: {
                                    router.showStore()
                                }, imageForeground: DartsImageName.storeForeground.rawValue,
                                             geometry: geometry)
                                
                                Text("store")
                                    .SpicyRice(size: 22)
                            }
                            
                            VStack {
                                SimpleButton(action: {
                                    router.showProgress()
                                }, imageForeground: DartsImageName.progressForeground.rawValue,
                                             geometry: geometry)

                                Text("progress")
                                    .SpicyRice(size: 22)
                            }
                            
                            VStack {
                                SimpleButton(action: {
                                    router.showRules()
                                }, imageForeground: DartsImageName.rulesForeground.rawValue,
                                             geometry: geometry)
                                
                                Text("rules")
                                    .SpicyRice(size: 22)
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
                                    .SpicyRice(size: 46, outlineWidth: 1.2)
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
                    DartsOptionsView(router: router)
                case .store:
                    DartsStoreView(router: router)
                case .progress:
                    DartsProgressView(router: router)
                case .rules:
                    DartsRulesView(router: router)
                case .pickGame:
                    DartsPickGameView(router: router)
                case .lose:
                    DartsLoseView(router: router)
                case .darts:
                    DartsGameView(router: router)
                case .grab:
                    DartsGrabView(router: router)
                }
            }
        }
    }
}

#Preview {
    DartsMenuView()
}

