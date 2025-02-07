import SwiftUI

class _DOVM: ObservableObject {
    let contact = _DOM()
    @Published var sliderValue = 5.0
    @Published var soundValue = 5.0
}
