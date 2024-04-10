//
//  File.swift
//  
//
//  Created by STS649-VISHNU S on 4/10/24.
//

import SwiftUI

///UIModel
public struct VTextFieldUIModel {
    var floatFont: Font
    var placeholderFont: Font
    var font: Font
    var height: CGFloat
    var foregroundColor: Color
    var backgroundColor: Color
    var floatBackgroundColor: Color
    var selectedColor: Color
    var unselectedColor: Color
    var cornerRadius: CGFloat
    var borderWidth: CGFloat
    
    //header
    var headerFont: Font
    var headerForgroundColor: Color
    var headerSpacing: CGFloat
    
    //icon
    var iconWidth: CGFloat
    var iconHeight: CGFloat
    
    //footer
    var footerFont: Font
    var footerForgroundColor: Color
    var footerSpacing: CGFloat
    
    public init(floatFont: Font = .custom("Avenir Medium", size: 12),
         placeholderFont: Font = .custom("Avenir", size: 16),
         font: Font = .custom("Avenir", size: 16),
         height: CGFloat = 50,
         foregroundColor: Color = .primary,
         backgroundColor: Color = Color(.systemBackground),
         floatBackgroundColor: Color = Color(.systemBackground),
         selectedColor: Color = .blue.opacity(0.75),
         unselectedColor: Color = .black.opacity(0.5),
         cornerRadius: CGFloat = 4.0,
         borderWidth: CGFloat = 1.75,
         //header
         headerFont: Font = .custom("Avenir Medium", size: 14),
         headerForgroundColor: Color = .gray,
         headerSpacing: CGFloat = 12,
         //icon
         iconWidth: CGFloat = 25,
         iconHeight: CGFloat = 25,
         //footer
         footerFont: Font = .custom("Avenir Medium", size: 14),
         footerForgroundColor: Color = .red,
         footerSpacing: CGFloat = 4
    ){
        
        self.floatFont = floatFont
        self.placeholderFont = placeholderFont
        self.font = font
        self.height = height
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.floatBackgroundColor = floatBackgroundColor
        self.selectedColor = selectedColor
        self.unselectedColor = unselectedColor
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
        self.headerFont = headerFont
        self.headerForgroundColor = headerForgroundColor
        self.headerSpacing = headerSpacing
        self.footerFont = footerFont
        self.footerForgroundColor = footerForgroundColor
        self.footerSpacing = footerSpacing
        self.iconWidth = iconWidth
        self.iconHeight = iconHeight
    }
}
