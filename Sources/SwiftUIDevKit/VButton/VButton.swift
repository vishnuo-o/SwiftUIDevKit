//
//  File.swift
//  
//
//  Created by Vishnu Priyan on on 4/12/24.
//

import SwiftUI

// MARK: - VButton
public struct VButton: View {
    ///UI model
    private var uiModel: VButtonUIModel = VButtonUIModel()
    private let title: String
    private let onClick: () -> Void
    
    public var body: some View {
        switch uiModel.fill {
        case .streched:
            Button(action: onClick) {
                Text(title)
            }
            .buttonStyle(ButtonStyle_Streched(uiModel: uiModel))
        case .proportional:
            Button(action: onClick) {
                Text(title)
            }
            .buttonStyle(ButtonStyle_Proportional(uiModel: uiModel))
        }
    }
}

///Background fill type
public enum FillType: String {
    case streched
    case proportional
}

///Streched Style
public struct ButtonStyle_Streched: ButtonStyle {
    var uiModel: VButtonUIModel
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: uiModel.width)
            .frame(height: uiModel.height)
            .foregroundStyle(uiModel.foregroundColor)
            .font(uiModel.font)
            .padding(uiModel.icon?.1 == .leading ? .leading : .trailing, (uiModel.icon?.0 == nil || uiModel.icon?.1 == .center ? 0 : uiModel.iconWidth))
            .overlay{
                if let image = uiModel.icon?.0{
                    HStack{
                        uiModel.icon?.1 == .trailing ? Spacer() : nil
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: uiModel.iconWidth, height: uiModel.iconHeight)
                            .padding(.horizontal, uiModel.iconHPadding)
                            .foregroundColor(uiModel.iconColor)
                        uiModel.icon?.1 == .leading ? Spacer() : nil
                    }
                }
            }
            .padding(uiModel.icon?.1 == .trailing ? .leading : .trailing, (uiModel.icon?.0 == nil || uiModel.icon?.1 == .center ? 0 : uiModel.iconWidth))
            .background(uiModel.backgroundColor)
            .cornerRadius(uiModel.cornerRadius)
            .scaleEffect(configuration.isPressed ? uiModel.animation ? 0.95 : 1.0 : 1.0)
            .padding(uiModel.topPadding)
    }
}

///Proportional to Title
public struct ButtonStyle_Proportional: ButtonStyle {
    var uiModel: VButtonUIModel
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: uiModel.height)
            .foregroundStyle(uiModel.foregroundColor)
            .font(uiModel.font)
            .padding(uiModel.padding)
            .padding(uiModel.icon?.1 == .leading ? .leading : .trailing, (uiModel.icon?.0 == nil ? 0 : uiModel.iconWidth*(uiModel.icon?.1 == .center ? 1 : 1.35)))
            .overlay{
                if let image = uiModel.icon?.0{
                    HStack{
                        uiModel.icon?.1 == .trailing ? Spacer() : nil
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: uiModel.iconWidth, height: uiModel.iconHeight)
                            .padding(.horizontal, uiModel.iconHPadding)
                            .foregroundColor(uiModel.iconColor)
                        uiModel.icon?.1 == .leading ? Spacer() : nil
                    }
                }
            }
            .background(uiModel.backgroundColor)
            .cornerRadius(uiModel.cornerRadius)
            .scaleEffect(configuration.isPressed ? uiModel.animation ? 0.95 : 1.0 : 1.0)
            .padding(uiModel.topPadding)
    }
}

//Streched to device Width
#Preview {
    VButton(uiModel: VButtonUIModel(font: .custom("Avenir Heavy", size: 20),
                                    backgroundColor: .green,
                                    icon: (Image(systemName: "chevron.down"), .trailing),
                                    iconColor: .white
                                   ), title: "Button") {
        print("pressed..")
    }
}

//Proportional to title
#Preview {
    VButton(uiModel: VButtonUIModel(font: .custom("Avenir Heavy", size: 20),
                                    backgroundColor: .green,
                                    fill: .proportional,
                                    icon: (Image(systemName: "plus.circle.fill"), .leading),
                                    iconColor: .yellow,
                                    iconWidth: 24,
                                    iconHeight: 24
                                   ), title: "Add") {
        print("pressed..")
    }
}

///Button Style Extension Reference
//extension ButtonStyle where Self == ButtonStyle_Streched {
//    public static var primary: ButtonStyle_Streched {
//        ButtonStyle_Streched(uiModel: VButtonUIModel())
//    }
//}
