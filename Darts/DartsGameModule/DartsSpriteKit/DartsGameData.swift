import SwiftUI

class DartsGameData: ObservableObject {
    @Published var isLose = false
    @Published var isWin = false
    @Published var timeLeft = 30
    @Published var countOfMiss = 0
    @Published var isArrowInFlight = false
    @Published var currentLevel = 0
}
