//
//  VButtonUIModel.swift
//
//
//  Created by STS649-VISHNU S on 4/12/24.
//

import SwiftUI

//MARK: - UIModel for Customization
public struct VButtonUIModel {
    var font: Font = .custom("Avenir Bold", size: 16)
    var width: CGFloat = .infinity
    var height: CGFloat = 50
    var foregroundColor: Color = .white
    var backgroundColor: Color = Color(60, 120, 240)
    
    //selection
    var selectedColor: Color = .white
    var unselectedColor: Color = .gray
    
    //border
    var cornerRadius: CGFloat = 4.0
    var borderWidth: CGFloat = 1.25
    
    //animation
    var animation: Bool = true
    
    //fill type
    var fill: FillType = .streched
    
    //icon
    var icon:(Image, Alignment)? = nil
    var iconColor: Color = .white
    var iconWidth: CGFloat = 18
    var iconHeight: CGFloat = 18
    var iconHPadding: CGFloat = 12
    
    //paddding
    var padding: EdgeInsets = .init(top: 0, leading: 12, bottom: 0, trailing: 12)
    var topPadding: Edge.Set = .top
    
    public init(font: Font, width: CGFloat, height: CGFloat, foregroundColor: Color, backgroundColor: Color, selectedColor: Color, unselectedColor: Color, cornerRadius: CGFloat, borderWidth: CGFloat, animation: Bool, fill: FillType, icon: (Image, Alignment)? = nil, iconColor: Color, iconWidth: CGFloat, iconHeight: CGFloat, iconHPadding: CGFloat, padding: EdgeInsets, topPadding: Edge.Set) {
        self.font = font
        self.width = width
        self.height = height
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.selectedColor = selectedColor
        self.unselectedColor = unselectedColor
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
        self.animation = animation
        self.fill = fill
        self.icon = icon
        self.iconColor = iconColor
        self.iconWidth = iconWidth
        self.iconHeight = iconHeight
        self.iconHPadding = iconHPadding
        self.padding = padding
        self.topPadding = topPadding
    }
}


