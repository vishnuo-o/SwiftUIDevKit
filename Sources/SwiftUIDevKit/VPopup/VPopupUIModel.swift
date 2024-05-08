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
    var backgroundColor: Color
    var shadowColor: Color
    var shadowRadius: CGFloat
    
    //border
    var cornerRadius: CGFloat
    var borderWidth: CGFloat
    var borderColor: Color
    
    //animation
    var animation: Animation
    var transition: AnyTransition
    
    //padding
    var padding: EdgeInsets
    
    public init(backgroundColor: Color = Color(.systemBackground),
                shadowColor: Color = Color(.placeholderText),
                shadowRadius: CGFloat = 1.0,
                cornerRadius: CGFloat = 8.0,
                borderWidth: CGFloat = 0.0,
                borderColor: Color = .clear,
                animation: Animation = .default,
                transition: AnyTransition = .scale,
                padding: EdgeInsets = .init(top: 12, leading: 12, bottom: 12, trailing: 12))
    {
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
