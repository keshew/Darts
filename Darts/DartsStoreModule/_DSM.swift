import SwiftUI

struct ItemModel: Hashable, Codable {
    var image: String
    var isAvailible: Bool
    var isSelected: Bool
}

struct ShopItemModel: Hashable, Codable {
    var image: String
    var bg: String
    var isAvailible: Bool
    var isSelected: Bool
}

struct _DSM {
    let arrayOfLabels = ["Freezes time for 15 seconds", "Backgrounds for game", "Skins for the ball"]
    let arrayOfLabels2 = ["Reduces the size of the dart", "", ""]
}
