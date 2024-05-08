//
//  VTextFieldUIModel.swift
//
//
//  Created by Vishnu Priyan on 4/12/24.
//

import SwiftUI

//MARK: - UIModel for Customization
public struct VTextFieldUIModel {
    //font
    var floatFont: Font
    var placeholderFont: Font
    var font: Font
    
    //spacing
    var floatLeadingSpacing: CGFloat
    var placeholderLeadingSpacing: CGFloat
    
    //frame
    var height: CGFloat
    var cornerRadius: CGFloat
    var borderWidth: CGFloat
    var borderType: BorderType
    
    //color
    var foregroundColor: Color
    var backgroundColor: Color
    var selectedBackgroundColor: Color
    var floatBackgroundColor: Color
    var selectedColor: Color
    var unselectedColor: Color
    
    //header
    var headerFont: Font
    var headerForgroundColor: Color
    var headerSpacing: CGFloat
    
    //icon
    var iconWidth: CGFloat
    var iconHeight: CGFloat
    var clearButtonWidth: CGFloat
    
    //footer
    var footerFont: Font
    var footerForgroundColor: Color
    var footerSpacing: CGFloat
    
    //clear btn
    var showClearButton: Bool
    
    public init(floatFont: Font = .custom("Avenir Medium", size: 12),
                placeholderFont: Font = .custom("Avenir", size: 14),
                font: Font = .custom("Avenir", size: 14),
                height: CGFloat = 50,
                foregroundColor: Color = .primary,
                backgroundColor: Color = Color(.systemBackground),
                selectedBackgroundColor: Color = Color(.systemBackground),
                floatBackgroundColor: Color = Color(.systemBackground),
                selectedColor: Color = Color(60, 120, 240),
                unselectedColor: Color = .black.opacity(0.5),
                cornerRadius: CGFloat = 4.0,
                borderWidth: CGFloat = 1.75,
                borderType: BorderType = .outline,
                //header
                headerFont: Font = .custom("Avenir Medium", size: 14),
                headerForgroundColor: Color = .gray,
                headerSpacing: CGFloat = 12,
                //icon
                iconWidth: CGFloat = 25,
                iconHeight: CGFloat = 25,
                clearButtonWidth: CGFloat = 15,
                //footer
                footerFont: Font = .custom("Avenir Medium", size: 14),
                footerForgroundColor: Color = .red,
                footerSpacing: CGFloat = 4,
                floatLeadingSpacing: CGFloat = 0,
                placeholderLeadingSpacing: CGFloat = 6,
                showClearButton: Bool = true
    ){
        
        self.floatFont = floatFont
        self.placeholderFont = placeholderFont
        self.font = font
        self.height = height
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.selectedBackgroundColor = selectedBackgroundColor
        self.floatBackgroundColor = floatBackgroundColor
        self.selectedColor = selectedColor
        self.unselectedColor = unselectedColor
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
        self.borderType = borderType
        self.headerFont = headerFont
        self.headerForgroundColor = headerForgroundColor
        self.headerSpacing = headerSpacing
        self.footerFont = footerFont
        self.footerForgroundColor = footerForgroundColor
        self.footerSpacing = footerSpacing
        self.iconWidth = iconWidth
        self.iconHeight = iconHeight
        self.clearButtonWidth = clearButtonWidth
        self.showClearButton = showClearButton
        self.floatLeadingSpacing = floatLeadingSpacing
        self.placeholderLeadingSpacing = placeholderLeadingSpacing
    }
}

// Border fill type
public enum BorderType: String {
    case outline
    case underline
}
