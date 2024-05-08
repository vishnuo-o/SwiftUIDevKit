//
//  VPopupUIModel.swift
//  VKitDemo
//
//  Created by STS649-VISHNU S on 4/23/24.
//

import SwiftUI

//MARK: - UIModel for Customization
public struct VPopupUIModel {
    //colors
    var backgroundColor: Color = Color(.systemBackground)
    var shadowColor: Color = Color(.placeholderText)
    var shadowRadius: CGFloat = 1.0
    
    //border
    var cornerRadius: CGFloat = 8.0
    var borderWidth: CGFloat = 0.0
    var borderColor: Color = .clear
    
    //animation
    var animation: Animation = .default
    var transition: AnyTransition = .scale
    
    //padding
    var padding: EdgeInsets = .init(top: 12, leading: 12, bottom: 12, trailing: 12)
    
    public init(backgroundColor: Color, shadowColor: Color, shadowRadius: CGFloat, cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: Color, animation: Animation, transition: AnyTransition, padding: EdgeInsets) {
        self.backgroundColor = backgroundColor
        self.shadowColor = shadowColor
        self.shadowRadius = shadowRadius
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
        self.borderColor = borderColor
        self.animation = animation
        self.transition = transition
        self.padding = padding
    }
}
