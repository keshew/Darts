import SwiftUI

class dgdgmv: ObservableObject {
    @Published var isLose = false
    @Published var isWin = false
    @Published var timeLeft = 30
    @Published var isMovingRight = false
    @Published var isMovingLeft = false
    @Published var isGrabingDown = false
    @Published var isGrabingUp = false
    @Published var isNodeAdded = false
    @Published var text = ""
}
