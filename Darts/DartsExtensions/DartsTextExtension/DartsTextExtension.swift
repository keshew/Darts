import SwiftUI

extension Text {
    func SpicyRice(size: CGFloat, outlineWidth: CGFloat = 0.5,
                   colorOutline: Color = Color(red: 94/255, green: 23/255, blue: 151/255),
                   firstColor: Color = Color(red: 241/255, green: 205/255, blue: 252/255),
                   secondColor: Color = .purple) -> some View {
        self.font(.custom("SpicyRice-Regular", size: size))
            .foregroundStyle(LinearGradient(colors: [firstColor,
                                                     secondColor],
                                            startPoint: .top,
                                            endPoint: .bottom))
            .outlineText(color: colorOutline, width: outlineWidth)
    }
}


