//
//  VButtonUIModel.swift
//
//
//  Created by STS649-VISHNU S on 4/12/24.
//

import SwiftUI

//MARK: - UIModel for Customization
public struct VButtonUIModel {
    public var  font: Font = .custom("Avenir Bold", size: 16)
    public var  width: CGFloat = .infinity
    public var  height: CGFloat = 50
    public var  foregroundColor: Color = .white
    public var  backgroundColor: Color = Color(60, 120, 240)
    
    //selection
    public var  selectedColor: Color = .white
    public var  unselectedColor: Color = .gray
    
    //border
    public var  cornerRadius: CGFloat = 4.0
    public var  borderWidth: CGFloat = 1.25
    
    //animation
    public var  animation: Bool = true
    
    //fill type
    public var  fill: FillType = .streched
    
    //icon
    public var  icon:(Image, Alignment)? = nil
    public var  iconColor: Color = .white
    public var  iconWidth: CGFloat = 18
    public var  iconHeight: CGFloat = 18
    public var  iconHPadding: CGFloat = 12
    
    //paddding
    public var  padding: EdgeInsets = .init(top: 0, leading: 12, bottom: 0, trailing: 12)
    public var  topPadding: Edge.Set = .top
}


