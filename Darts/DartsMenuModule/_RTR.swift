import SwiftUI

enum AppScreen: Hashable {
    case options
    case store
    case progress
    case rules
    case pickGame
    case lose
    case darts
    case grab
}

final class _RTR: ObservableObject {
    @Published var path: [AppScreen] = []
    
    func showOptions() {
        path.append(.options)
    }
    
    func showStore() {
        path.append(.store)
    }
    
    func showProgress() {
        path.append(.progress)
    }
    
    func showRules() {
        path.append(.rules)
    }
    
    func showPickGame() {
        path.append(.pickGame)
    }
    
    func showLose() {
        path.append(.lose)
    }
    
    func showDarts() {
        path.append(.darts)
    }
    
    func showGrab() {
        path.append(.grab)
    }
    
    func back() {
        if !path.isEmpty {
            if path.last == .pickGame {
                path.removeAll()
            } else {
                path.removeLast()
            }
        }
    }
}
