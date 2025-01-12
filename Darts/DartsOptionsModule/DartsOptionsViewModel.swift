import SwiftUI

class DartsOptionsViewModel: ObservableObject {
    let contact = DartsOptionsModel()
    @Published var sliderValue = 5.0
    @Published var soundValue = 5.0
}
