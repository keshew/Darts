import SwiftUI

struct DartsStoreView: View {
    @StateObject var dartsStoreModel =  DartsStoreViewModel()
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
                        
                        Text("STORE")
                            .SpicyRice(size: 42)
                            .padding(.leading, 25)
                        
                        Spacer()
                        
                        ZStack {
                            Image(.moneyBackground)
                                .resizable()
                                .frame(width: 95, height: 50)
                            
                            HStack(spacing: 5) {
                                Image(.coin)
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                
                                Text("\(UserDefaultsManager.defaults.object(forKey: Keys.countOfMoney.rawValue)!)")
                                    .SpicyRice(size: 20,
                                               firstColor: .white,
                                               secondColor: .orange)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                    Spacer()
                    
                    VStack(spacing: 60) {
                        VStack {
                            Text("Freezes time for 15 seconds")
                                .SpicyRice(size: 24)
                            
                            HStack(spacing: 40) {
                                ItemToBuy(geometry: geometry,
                                          itemImage: DartsImageName.timeFreezItem.rawValue,
                                          costMoney: "95",
                                          countOfItem: "2") {
                                    
                                }
                                
                                ItemToBuy(geometry: geometry,
                                          itemImage: DartsImageName.timeFreezItem.rawValue,
                                          costMoney: "200",
                                          countOfItem: "5") {
                                    
                                }
                            }
                        }
                        
                        VStack {
                            Text("Reduces the size of the dart")
                                .SpicyRice(size: 24)
                            
                            HStack(spacing: 40) {
                                ItemToBuy(geometry: geometry,
                                          itemImage: DartsImageName.reduseSizeDartsItem.rawValue,
                                          costMoney: "130",
                                          countOfItem: "2",
                                          offsetXOfItemImage: -0.01) {

                                }
                                
                                ItemToBuy(geometry: geometry,
                                          itemImage: DartsImageName.reduseSizeDartsItem.rawValue,
                                          costMoney: "250",
                                          countOfItem: "4",
                                          offsetXOfItemImage: -0.01) {
                                    
                                }
                            }
                        }
                        .padding(.bottom)
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
    return DartsStoreView(router: router)
}

