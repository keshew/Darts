import Foundation

enum Keys: String {
    case ballItem = "ballItem"
    case bgItem = "bgItem"
    case numberOfLevel = "numberOfLevel"
    case levelFind = "levelFind"
    case countOfMoney = "countOfMoney"
}

class UserDefaultsManager: ObservableObject {
    static let defaults = UserDefaults.standard
    
    
    @Published var arrayOfBall = [ItemModel(image: DartsImageName.ball1.rawValue, isAvailible: false, isSelected: false),
                                  ItemModel(image: DartsImageName.ball2.rawValue, isAvailible: false, isSelected: false),
                                  ItemModel(image: DartsImageName.ball3.rawValue, isAvailible: false, isSelected: false),
                                  ItemModel(image: DartsImageName.ball4.rawValue, isAvailible: false, isSelected: false)]
    
    @Published var arrayOfBackground = [ShopItemModel(image: DartsImageName.bg1.rawValue, bg: DartsImageName.back1.rawValue, isAvailible: false, isSelected: false),
                                        ShopItemModel(image: DartsImageName.bg2.rawValue, bg: DartsImageName.back2.rawValue, isAvailible: false, isSelected: false),
                                        ShopItemModel(image: DartsImageName.bg3.rawValue, bg: DartsImageName.back3.rawValue, isAvailible: false, isSelected: false),
                                        ShopItemModel(image: DartsImageName.bg4.rawValue, bg: DartsImageName.back4.rawValue, isAvailible: false, isSelected: false)]
    
    func saveBalls(array: [ItemModel]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(array) {
            UserDefaultsManager.defaults.set(encoded, forKey: Keys.ballItem.rawValue)
        }
    }
    
    func loadBalls() -> [ItemModel]? {
        if let savedBallsData = UserDefaultsManager.defaults.data(forKey: Keys.ballItem.rawValue) {
            let decoder = JSONDecoder()
            if let loadedBalls = try? decoder.decode([ItemModel].self, from: savedBallsData) {
                return loadedBalls
            }
        }
        return nil
    }
    
    func manageBall(at index: Int) {
        var balls = loadBalls() ?? []
        
        guard index >= 0 && index < balls.count else {
            return
        }
        
        let selectedBall = balls[index]
        
        if selectedBall.isSelected {
            return
        }
        
        if selectedBall.isAvailible {
            for i in 0..<balls.count {
                if balls[i].isSelected {
                    balls[i].isSelected = false
                    balls[i].isAvailible = true
                    break
                }
            }
            
            balls[index].isSelected = true
            balls[index].isAvailible = false
        } else {
            let countOfMoney = UserDefaultsManager.defaults.integer(forKey: Keys.countOfMoney.rawValue)
            if countOfMoney >= 250 {
                let userWantsToBuy = true
                if userWantsToBuy {
                    balls[index].isAvailible = true
                    for i in 0..<balls.count {
                        if balls[i].isSelected {
                            balls[i].isSelected = false
                            balls[i].isAvailible = true
                            break
                        }
                    }
                    
                    balls[index].isSelected = true
                    balls[index].isAvailible = false
                    UserDefaultsManager.defaults.set(countOfMoney - 250, forKey: Keys.countOfMoney.rawValue)
                }
            }
        }
        saveBalls(array: balls)
    }
    
    func saveBackground(array: [ShopItemModel]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(array) {
            UserDefaultsManager.defaults.set(encoded, forKey: Keys.bgItem.rawValue)
        }
    }
    
    func loadBackground() -> [ShopItemModel]? {
        if let savedBallsData = UserDefaultsManager.defaults.data(forKey: Keys.bgItem.rawValue) {
            let decoder = JSONDecoder()
            if let loadedBalls = try? decoder.decode([ShopItemModel].self, from: savedBallsData) {
                return loadedBalls
            }
        }
        return nil
    }
    
    func manageBackground(at index: Int) {
        var balls = loadBackground() ?? []
        
        guard index >= 0 && index < balls.count else {
            return
        }
        
        let selectedBall = balls[index]
        
        if selectedBall.isSelected {
            return
        }
        
        if selectedBall.isAvailible {
            for i in 0..<balls.count {
                if balls[i].isSelected {
                    balls[i].isSelected = false
                    balls[i].isAvailible = true
                    break
                }
            }
            
            balls[index].isSelected = true
            balls[index].isAvailible = false
        } else {
            let countOfMoney = UserDefaultsManager.defaults.integer(forKey: Keys.countOfMoney.rawValue)
            if countOfMoney >= 250 {
                let userWantsToBuy = true
                if userWantsToBuy {
                    balls[index].isAvailible = true
                    for i in 0..<balls.count {
                        if balls[i].isSelected {
                            balls[i].isSelected = false
                            balls[i].isAvailible = true
                            break
                        }
                    }
                    
                    balls[index].isSelected = true
                    balls[index].isAvailible = false
                    UserDefaultsManager.defaults.set(countOfMoney - 250, forKey: Keys.countOfMoney.rawValue)
                }
            }
        }
        saveBackground(array: balls)
    }
    
    func getSelectedBall() -> String? {
        let loadedBalls = loadBalls() ?? arrayOfBall
        
        for shopItem in loadedBalls {
            if shopItem.isSelected {
                return shopItem.image
            }
        }
        return nil
    }
    
    func getSelectedBackground() -> String? {
        let loadedBackgrounds = loadBackground() ?? arrayOfBackground
        
        for shopItem in loadedBackgrounds {
            if shopItem.isSelected {
                return shopItem.bg
            }
        }
        return nil
    }
    
    func firstLaunch() {
        if UserDefaultsManager.defaults.string(forKey: Keys.numberOfLevel.rawValue) == nil {
            UserDefaultsManager.defaults.set(1, forKey: Keys.numberOfLevel.rawValue)
            UserDefaultsManager.defaults.set(1, forKey: Keys.levelFind.rawValue)
            UserDefaultsManager.defaults.set(150, forKey: Keys.countOfMoney.rawValue)
            saveBalls(array: arrayOfBall)
            saveBackground(array: arrayOfBackground)
        }
    }
    
    func completeLevel(countOfMoney: Int) {
        let level = UserDefaultsManager.defaults.object(forKey: Keys.numberOfLevel.rawValue) as? Int ?? 0
        let money = UserDefaultsManager.defaults.object(forKey: Keys.countOfMoney.rawValue) as? Int ?? 0
        UserDefaultsManager.defaults.set(level + 1, forKey: Keys.numberOfLevel.rawValue)
        UserDefaultsManager.defaults.set(money + countOfMoney, forKey: Keys.countOfMoney.rawValue)
    }
    
    func completeFind() {
        let level = UserDefaultsManager.defaults.object(forKey: Keys.levelFind.rawValue) as? Int ?? 0
        let money = UserDefaultsManager.defaults.object(forKey: Keys.countOfMoney.rawValue) as? Int ?? 0
        UserDefaultsManager.defaults.set(level + 1, forKey: Keys.levelFind.rawValue)
        UserDefaultsManager.defaults.set(money + 50, forKey: Keys.countOfMoney.rawValue)
    }
    
    func completeDarts() {
        let level = UserDefaultsManager.defaults.object(forKey: Keys.numberOfLevel.rawValue) as? Int ?? 0
        let money = UserDefaultsManager.defaults.object(forKey: Keys.countOfMoney.rawValue) as? Int ?? 0
        UserDefaultsManager.defaults.set(level + 1, forKey: Keys.numberOfLevel.rawValue)
        UserDefaultsManager.defaults.set(money + 50, forKey: Keys.countOfMoney.rawValue)
    }
}
