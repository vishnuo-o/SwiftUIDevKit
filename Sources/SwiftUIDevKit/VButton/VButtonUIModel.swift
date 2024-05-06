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
}


