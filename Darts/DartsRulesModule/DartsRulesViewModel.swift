import SwiftUI

class DartsRulesViewModel: ObservableObject {
    let contact = DartsRulesModel()
    @Published var currentIndex = 0
    
    func increaseIndex() {
        currentIndex += 1
    }
    
    func lowerIndex() {
        currentIndex -= 1
    }
}
