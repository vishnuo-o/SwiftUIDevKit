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
    public var backgroundColor: Color = Color(.systemBackground)
    public var shadowColor: Color = Color(.placeholderText)
    public var shadowRadius: CGFloat = 1.0
    
    //border
    public var cornerRadius: CGFloat = 8.0
    public var borderWidth: CGFloat = 0.0
    public var borderColor: Color = .clear
    
    //animation
    public var animation: Animation = .default
    public var transition: AnyTransition = .scale
    
    //padding
    public var padding: EdgeInsets = .init(top: 12, leading: 12, bottom: 12, trailing: 12)
}
