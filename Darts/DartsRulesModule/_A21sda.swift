import SwiftUI

class _A21sda: ObservableObject {
    let contact = asd_as()
    @Published var currentIndex = 0
    
    func increaseIndex() {
        currentIndex += 1
    }
    
    func lowerIndex() {
        currentIndex -= 1
    }
}
