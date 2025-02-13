import SwiftUI

struct _0b1: View {
    var action: (() -> ())
    var imageForeground: String
    var geometry: GeometryProxy
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(.backButton)
                    .resizable()
                    .frame(width: geometry.size.width * 0.191,
                           height: geometry.size.height * 0.06)
                    .offset(y: geometry.size.height * 0.04)
                
                Image(imageForeground)
                    .resizable()
                    .frame(width: geometry.size.width * 0.23,
                           height: geometry.size.width * 0.23)
            }
        }
    }
}

struct _RR1: View {
    var action: (() -> ())
    var imageForeground: String
    var geometry: GeometryProxy
    var sizeBackgroundImage: CGFloat = 0.155
    var sizeWForegroundImage: CGFloat = 0.129
    var sizeHForegroundImage: CGFloat = 0.14
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(.roundBackground)
                    .resizable()
                    .frame(width: geometry.size.width * sizeBackgroundImage,
                           height: geometry.size.width * sizeBackgroundImage)
                
                Image(imageForeground)
                    .resizable()
                    .frame(width: geometry.size.width * sizeWForegroundImage,
                           height: geometry.size.width * sizeHForegroundImage)
            }
        }
    }
}

struct _SN: View {
    var imageForeground: String
    var sizeHImage: CGFloat
    var sizeWImage: CGFloat
    var offsetY: CGFloat = -23
    var geometry: GeometryProxy
    var body: some View {
        ZStack {
            Image(.backButton)
                .resizable()
                .frame(width: geometry.size.width * 0.306,
                       height: geometry.size.height * 0.1)
            
            Image(imageForeground)
                .resizable()
                .frame(width: sizeWImage, height: sizeHImage)
                .offset(y: offsetY)
        }
    }
}

struct _ITB: View {
    var geometry: GeometryProxy
    var itemImage: String
    var costMoney: String
    var countOfItem: String
    var offsetXOfItemImage: CGFloat = 0.015
    var action: (() -> ())
    var body: some View {
        ZStack {
            Image(.shopItemBackground)
                .resizable()
                .frame(width: geometry.size.width * 0.37,
                       height: geometry.size.height * 0.29)
            
            Image(itemImage)
                .resizable()
                .frame(width: geometry.size.width * 0.218,
                       height: geometry.size.height * 0.119)
                .offset(x: -geometry.size.width * offsetXOfItemImage)
            
            Image(.volumePin)
                .resizable()
                .frame(width: geometry.size.width * 0.09,
                       height: geometry.size.width * 0.09)
                .offset(x: geometry.size.width * 0.078,
                        y: geometry.size.height * 0.047)
            
            Text(countOfItem)
                ._SR(size: 20)
                .offset(x: geometry.size.width * 0.078,
                        y: geometry.size.height * 0.047)
            
            Button(action: {
                action()
            }) {
                ZStack {
                    Image(.backButtonBorder)
                        .resizable()
                        .frame(width: geometry.size.width * 0.37,
                               height: geometry.size.height * 0.08)
                    
                    Text("BUY")
                        ._SR(size: 32, outlineWidth: 1.2)
                    
                    Image(.costMoneyBackground)
                        .resizable()
                        .frame(width: geometry.size.width * 0.11,
                               height: geometry.size.height * 0.031)
                        .offset(x: geometry.size.width * 0.129,
                                y: geometry.size.height * 0.027)
                    
                    Image(.coin)
                        .resizable()
                        .frame(width: geometry.size.width * 0.04,
                               height: geometry.size.height * 0.02)
                        .offset(x: geometry.size.width * 0.105,
                                y: geometry.size.height * 0.027)
                    
                    Text(costMoney)
                        ._SR(size: 9,
                                   firstColor: .white,
                                   secondColor: .orange)
                        .offset(x: geometry.size.width * 0.15,
                                y: geometry.size.height * 0.027)
                }
            }
            .offset(x: 0, y: geometry.size.height * 0.145)
        }
    }
}

struct BallItem: View {
    var geometry: GeometryProxy
    var image: String
    var action: (() -> ())
    var body: some View {
        ZStack {
            Image(.shopItemBackground)
                .resizable()
                .frame(width: geometry.size.width * 0.37,
                       height: geometry.size.height * 0.29)
            
            Image(image)
                .resizable()
                .frame(width: geometry.size.width * 0.19,
                       height: geometry.size.height * 0.095)
            
            Button(action: {
                action()
            }) {
                ZStack {
                    Image(.backButtonBorder)
                        .resizable()
                        .frame(width: geometry.size.width * 0.37,
                               height: geometry.size.height * 0.08)
                    
                    Text("BUY")
                        ._SR(size: 32, outlineWidth: 1.2)
                    
                    Image(.costMoneyBackground)
                        .resizable()
                        .frame(width: geometry.size.width * 0.11,
                               height: geometry.size.height * 0.031)
                        .offset(x: geometry.size.width * 0.129,
                                y: geometry.size.height * 0.027)
                    
                    Image(.coin)
                        .resizable()
                        .frame(width: geometry.size.width * 0.04,
                               height: geometry.size.height * 0.02)
                        .offset(x: geometry.size.width * 0.105,
                                y: geometry.size.height * 0.027)
                    
                    Text("250")
                        ._SR(size: 9,
                                   firstColor: .white,
                                   secondColor: .orange)
                        .offset(x: geometry.size.width * 0.15,
                                y: geometry.size.height * 0.027)
                }
            }
            .offset(x: 0, y: geometry.size.height * 0.145)
        }
    }
}

struct BallItemSelected: View {
    var geometry: GeometryProxy
    var image: String
    var action: (() -> ())
    var body: some View {
        ZStack {
            Image(.shopItemBackground)
                .resizable()
                .frame(width: geometry.size.width * 0.37,
                       height: geometry.size.height * 0.29)
            
            Image(image)
                .resizable()
                .frame(width: geometry.size.width * 0.19,
                       height: geometry.size.height * 0.095)
            
            Button(action: {
                action()
            }) {
                Image(.selected)
                    .resizable()
                    .frame(width: geometry.size.width * 0.37,
                           height: geometry.size.height * 0.08)
            }
            .offset(x: 0, y: geometry.size.height * 0.145)
        }
    }
}

struct ShopItem: View {
    var geometry: GeometryProxy
    var image: String
    var action: (() -> ())
    var body: some View {
        ZStack {
            Image(.shopItemBackground)
                .resizable()
                .frame(width: geometry.size.width * 0.37,
                       height: geometry.size.height * 0.29)
            
            Image(image)
                .resizable()
                .frame(width: geometry.size.width * 0.218,
                       height: geometry.size.height * 0.2)
                .offset(y: -23)
            
            Button(action: {
                action()
            }) {
                ZStack {
                    Image(.backButtonBorder)
                        .resizable()
                        .frame(width: geometry.size.width * 0.37,
                               height: geometry.size.height * 0.08)
                    
                    Text("BUY")
                        ._SR(size: 32, outlineWidth: 1.2)
                    
                    Image(.costMoneyBackground)
                        .resizable()
                        .frame(width: geometry.size.width * 0.11,
                               height: geometry.size.height * 0.031)
                        .offset(x: geometry.size.width * 0.129,
                                y: geometry.size.height * 0.027)
                    
                    Image(.coin)
                        .resizable()
                        .frame(width: geometry.size.width * 0.04,
                               height: geometry.size.height * 0.02)
                        .offset(x: geometry.size.width * 0.105,
                                y: geometry.size.height * 0.027)
                    
                    Text("250")
                        ._SR(size: 9,
                                   firstColor: .white,
                                   secondColor: .orange)
                        .offset(x: geometry.size.width * 0.15,
                                y: geometry.size.height * 0.027)
                }
            }
            .offset(x: 0, y: geometry.size.height * 0.145)
        }
    }
}

struct ShopItemSelected: View {
    var geometry: GeometryProxy
    var image: String
    var action: (() -> ())
    var body: some View {
        ZStack {
            Image(.shopItemBackground)
                .resizable()
                .frame(width: geometry.size.width * 0.37,
                       height: geometry.size.height * 0.29)
            
            Image(image)
                .resizable()
                .frame(width: geometry.size.width * 0.218,
                       height: geometry.size.height * 0.2)
                .offset(y: -23)
            
            Button(action: {
                action()
            }) {
                Image(.selected)
                    .resizable()
                    .frame(width: geometry.size.width * 0.37,
                           height: geometry.size.height * 0.08)
            }
            .offset(x: 0, y: geometry.size.height * 0.145)
        }
    }
}

struct _PL: View {
    var geometry: GeometryProxy
    var label1: String
    var label2: String
    var label3: String
    var image: String = DartsImageName.dartsIcon.rawValue
    var body: some View {
        ZStack {
            Image(.progressLabelBackground)
                .resizable()
                .frame(width: geometry.size.width * 0.689,
                       height: geometry.size.height * 0.264)
            
            Image(image)
                .resizable()
                .frame(width: geometry.size.width * 0.306,
                       height: geometry.size.width * 0.306)
                .offset(x: -geometry.size.width * 0.306,
                        y: -geometry.size.height * 0.08)
            
            VStack(spacing: -5) {
                Text(label1)
                    ._SR(size: 34, outlineWidth: 1.3)
                
                Text(label2)
                    ._SR(size: 44, firstColor: .white, secondColor: .purple)
                
                Text(label3)
                    ._SR(size: 26, outlineWidth: 1.3)
            }
        }
    }
}

struct _PGB: View {
    var imageForeground: String = DartsImageName.dartsIcon.rawValue
    var nameGame: String = "DARTS"
    var geometry: GeometryProxy
    var offsetY: CGFloat = 0
    var sizeH: CGFloat = 0.198
    var sizeW: CGFloat = 0.382
    var offsetX: CGFloat = 0.23
    var action: (() -> ())
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(.backButtonBorder)
                    .resizable()
                    .frame(width: geometry.size.width * 0.64,
                           height: geometry.size.height * 0.132)
                
                Image(imageForeground)
                    .resizable()
                    .frame(width: geometry.size.width * sizeW,
                           height: geometry.size.height * sizeH)
                    .offset(x: -geometry.size.width * offsetX, y: offsetY)
                
                Text(nameGame)
                    ._SR(size: 38, outlineWidth: 1.1)
                    .offset(x: geometry.size.width * 0.091)
            }
        }
    }
}

struct _CS: View {
    @Binding var value: Double
    let range: ClosedRange<Double>
    let thumbSize: CGFloat = 50
    let trackHeight: CGFloat = 25
    let sizeSlider: CGFloat
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color(red: 241/255, green: 198/255, blue: 252/255))
                    .frame(height: trackHeight)
                    .cornerRadius(8)
                
                Rectangle()
                    .fill(Color(red: 89/255, green: 19/255, blue: 143/255))
                    .frame(width: CGFloat(normalizedValue) * geometry.size.width, height: trackHeight)
                    .cornerRadius(8)
                
                Image(DartsImageName.volumePin.rawValue)
                    .resizable()
                    .frame(width: thumbSize, height: thumbSize)
                    .offset(x: CGFloat(normalizedValue) * (geometry.size.width - thumbSize))
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                updateValue(with: gesture.location.x, in: geometry.size.width)
                            }
                    )
            }
        }
        .frame(width: sizeSlider, height: thumbSize)
    }
    
    private var normalizedValue: Double {
        return (value - range.lowerBound) / (range.upperBound - range.lowerBound)
    }
    
    private func updateValue(with locationX: CGFloat, in totalWidth: CGFloat) {
        let newValue = (locationX / totalWidth) * (range.upperBound - range.lowerBound) + range.lowerBound
        value = min(max(newValue, range.lowerBound), range.upperBound)
    }
}

struct BackShopBtn: View {
    var image: String
    var action: (() -> ())
    var body: some View {
        Button(action: {
            action()
        }) {
            Image(image)
                .resizable()
                .frame(width: 50, height: 50)
        }
    }
}
