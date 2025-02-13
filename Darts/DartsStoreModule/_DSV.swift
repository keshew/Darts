import SwiftUI

struct _DSV: View {
    @StateObject var dartsStoreModel =  _DSVM()
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
                        
                        Text("STORE")
                            ._SR(size: 42)
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
                                    ._SR(size: 20,
                                               firstColor: .white,
                                               secondColor: .orange)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                    Spacer()
                    
                    VStack(spacing: 55) {
                        VStack(spacing: 0) {
                            Text(dartsStoreModel.contact.arrayOfLabels[dartsStoreModel.currentIndex])
                                ._SR(size: 24)
                                .frame(height: 35)
                            
                            if dartsStoreModel.currentIndex == 0 {
                                HStack(spacing: 40) {
                                    _ITB(geometry: geometry,
                                              itemImage: DartsImageName.timeFreezItem.rawValue,
                                              costMoney: "95",
                                              countOfItem: "2") {
                                        
                                    }
                                
                                    _ITB(geometry: geometry,
                                              itemImage: DartsImageName.timeFreezItem.rawValue,
                                              costMoney: "200",
                                              countOfItem: "5") {
                                    }
                                }
                            } else if dartsStoreModel.currentIndex == 1 {
                                HStack(spacing: 40) {
                                    if UserDefaultsManager().loadBackground()?[0].isSelected ?? false {
                                        ShopItemSelected(geometry: geometry,
                                                 image: DartsImageName.bg1.rawValue) {
                                            
                                        }
                                    } else {
                                        ShopItem(geometry: geometry,
                                                 image: DartsImageName.bg1.rawValue) {
                                            UserDefaultsManager().manageBackground(at: 0)
                                            dartsStoreModel.bla = 1
                                        }
                                    }
                                    
                                    if UserDefaultsManager().loadBackground()?[1].isSelected ?? false {
                                        ShopItemSelected(geometry: geometry,
                                                 image: DartsImageName.bg2.rawValue) {
                                            
                                        }
                                    } else {
                                        ShopItem(geometry: geometry,
                                                 image: DartsImageName.bg2.rawValue) {
                                            UserDefaultsManager().manageBackground(at: 1)
                                            dartsStoreModel.bla = 1
                                        }
                                    }
                                }
                            } else {
                                HStack(spacing: 40) {
                                    if UserDefaultsManager().loadBalls()?[0].isSelected ?? false {
                                        BallItemSelected(geometry: geometry,
                                                 image: DartsImageName.ball1.rawValue) {
                                            
                                        }
                                    } else {
                                        BallItem(geometry: geometry,
                                                 image: DartsImageName.ball1.rawValue) {
                                            UserDefaultsManager().manageBall(at: 0)
                                            dartsStoreModel.bla = 1
                                        }
                                    }
                                    
                                    if UserDefaultsManager().loadBalls()?[2].isSelected ?? false {
                                        BallItemSelected(geometry: geometry,
                                                 image: DartsImageName.ball3.rawValue) {
                                            
                                        }
                                    } else {
                                        BallItem(geometry: geometry,
                                                 image: DartsImageName.ball3.rawValue) {
                                            UserDefaultsManager().manageBall(at: 2)
                                            dartsStoreModel.bla = 1
                                        }
                                    }
                                }
                            }
                        }
                        
                        VStack(spacing: 0) {
                            VStack(spacing: -10) {
                                HStack {
                                    BackShopBtn(image: DartsImageName.backShopBtn.rawValue) {
                                        dartsStoreModel.currentIndex -= 1
                                    }
                                    .disabled(dartsStoreModel.currentIndex == 0 ? true : false)
                                    .opacity(dartsStoreModel.currentIndex == 0 ? 0.5 : 1)
                                    
                                    Spacer()
                                    
                                    BackShopBtn(image: DartsImageName.nextShopBtn.rawValue) {
                                        dartsStoreModel.currentIndex += 1
                                    }
                                    .disabled(dartsStoreModel.currentIndex == 2 ? true : false)
                                    .opacity(dartsStoreModel.currentIndex == 2 ? 0.5 : 1)
                                }
                                .padding(.horizontal)
                                
                                Text(dartsStoreModel.contact.arrayOfLabels2[dartsStoreModel.currentIndex])
                                    ._SR(size: 22)
                                    .frame(height: 30)
                            }
                            
                            if dartsStoreModel.currentIndex == 0 {
                                HStack(spacing: 40) {
                                    _ITB(geometry: geometry,
                                              itemImage: DartsImageName.reduseSizeDartsItem.rawValue,
                                              costMoney: "130",
                                              countOfItem: "2",
                                              offsetXOfItemImage: -0.01) {

                                    }
                                    
                                    _ITB(geometry: geometry,
                                              itemImage: DartsImageName.reduseSizeDartsItem.rawValue,
                                              costMoney: "250",
                                              countOfItem: "4",
                                              offsetXOfItemImage: -0.01) {
                                        
                                    }
                                }
                            } else if dartsStoreModel.currentIndex == 1 {
                                HStack(spacing: 40) {
                                    if UserDefaultsManager().loadBackground()?[2].isSelected ?? false {
                                        ShopItemSelected(geometry: geometry,
                                                 image: DartsImageName.bg3.rawValue) {
                                            
                                        }
                                    } else {
                                        ShopItem(geometry: geometry,
                                                 image: DartsImageName.bg3.rawValue) {
                                            UserDefaultsManager().manageBackground(at: 2)
                                            dartsStoreModel.bla = 1
                                        }
                                    }
                                    
                                    if UserDefaultsManager().loadBackground()?[3].isSelected ?? false {
                                        ShopItemSelected(geometry: geometry,
                                                 image: DartsImageName.bg4.rawValue) {
                                            
                                        }
                                    } else {
                                        ShopItem(geometry: geometry,
                                                 image: DartsImageName.bg4.rawValue) {
                                            UserDefaultsManager().manageBackground(at: 3)
                                            dartsStoreModel.bla = 1
                                        }
                                    }
                                }
                            } else {
                                HStack(spacing: 40) {
                                    if UserDefaultsManager().loadBalls()?[1].isSelected ?? false {
                                        BallItemSelected(geometry: geometry,
                                                 image: DartsImageName.ball2.rawValue) {
                                            
                                        }
                                    } else {
                                        BallItem(geometry: geometry,
                                                 image: DartsImageName.ball2.rawValue) {
                                            UserDefaultsManager().manageBall(at: 1)
                                            dartsStoreModel.bla = 1
                                        }
                                    }
                                    
                                    if UserDefaultsManager().loadBalls()?[3].isSelected ?? false {
                                        BallItemSelected(geometry: geometry,
                                                 image: DartsImageName.ball4.rawValue) {
                                            
                                        }
                                    } else {
                                        BallItem(geometry: geometry,
                                                 image: DartsImageName.ball4.rawValue) {
                                            UserDefaultsManager().manageBall(at: 3)
                                            dartsStoreModel.bla = 1
                                        }
                                    }
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
    @ObservedObject var router = _RTR()
    return _DSV(router: router)
}

