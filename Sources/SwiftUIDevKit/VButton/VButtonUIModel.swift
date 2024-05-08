//
//  VButtonUIModel.swift
//
//
//  Created by Vishnu Priyan on 4/12/24.
//

import SwiftUI

//MARK: - UIModel for Customization
public struct VButtonUIModel {
    var font: Font
    var foregroundColor: Color
    var backgroundColor: Color
    
    //fill type
    var fill: FillType
    var width: CGFloat
    var height: CGFloat
    
    //selection
    var selectedColor: Color
    var unselectedColor: Color
    
    //border
    var cornerRadius: CGFloat
    var borderWidth: CGFloat
    
    //animation
    var animation: Bool
    
    //icon
    var icon:(Image, Alignment)?
    var iconColor: Color
    var iconWidth: CGFloat
    var iconHeight: CGFloat
    var iconHPadding: CGFloat
    
    //paddding
    var padding: EdgeInsets
    var topPadding: Edge.Set
    
    public init(font: Font = .custom("Avenir Bold", size: 16),
                foregroundColor: Color = .white,
                backgroundColor: Color = Color(60, 120, 240),
                fill: FillType = .streched,
                width: CGFloat = .infinity,
                height: CGFloat = 50,
                selectedColor: Color = .white,
                unselectedColor: Color = .gray,
                cornerRadius: CGFloat = 4.0,
                borderWidth: CGFloat = 1.25,
                animation: Bool = false,
                icon: (Image, Alignment)? = nil,
                iconColor: Color = .white,
                iconWidth: CGFloat = 18,
                iconHeight: CGFloat = 18,
                iconHPadding: CGFloat = 12,
                padding: EdgeInsets = .init(top: 0, leading: 12, bottom: 0, trailing: 12),
                topPadding: Edge.Set = .top)
    {
        self.font = font
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.fill = fill
        self.width = width
        self.height = height
        self.selectedColor = selectedColor
        self.unselectedColor = unselectedColor
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
        self.animation = animation
        self.icon = icon
        self.iconColor = iconColor
        self.iconWidth = iconWidth
        self.iconHeight = iconHeight
        self.iconHPadding = iconHPadding
        self.padding = padding
        self.topPadding = topPadding
    }
}


