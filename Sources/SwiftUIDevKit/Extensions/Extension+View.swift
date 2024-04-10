//
//  Extension+View.swift
//  VKit
//
//  Created by STS649-VISHNU S on 4/10/24.
//

import SwiftUI

extension View {
    ///Header
    public func setHeader(text: String?, font: Font, textColor: Color, spacing: CGFloat) -> some View {
        VStack(alignment: .leading, spacing: spacing){
            if let text{
                Text(text)
                    .font(font)
                    .foregroundColor(textColor)
            }
            self
        }
    }
    
    ///Footer
    public func setFooter(text: String?, font: Font, textColor: Color, spacing: CGFloat) -> some View {
        VStack(alignment: .leading, spacing: spacing){
            self
            if let text{
                Text(text)
                    .font(font)
                    .foregroundColor(textColor)
            }
        }
    }
}
