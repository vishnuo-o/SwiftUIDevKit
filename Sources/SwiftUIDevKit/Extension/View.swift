//
//  Extension+View.swift
//  VKit
//
//  Created by Vishnu Priyan on 4/12/24.
//

import SwiftUI

// MARK: - Extension for View
extension View {
    // MARK: - Header
    public func setHeader(text: String?, font: Font, textColor: Color, alignment: HorizontalAlignment = .leading, spacing: CGFloat) -> some View {
        VStack(alignment: alignment, spacing: spacing){
            if let text{
                Text(text)
                    .font(font)
                    .foregroundColor(textColor)
            }
            self
        }
    }
    
    // MARK: - Footer
    public func setFooter(text: String?, font: Font, textColor: Color, alignment: HorizontalAlignment = .leading, spacing: CGFloat, info: AnyView? = nil) -> some View {
        VStack(alignment: alignment, spacing: spacing){
            self
            HStack(spacing: 4){
                if let text{
                    info
                    Text(text)
                        .font(font)
                        .foregroundColor(textColor)
                }
            }
        }
    }
    
    // MARK: - Custom View
    public func presentPopup<PopupView>(uiModel: VPopupUIModel, isPresented: Bool, popupView: @escaping() -> PopupView) -> some View where PopupView: View {
        return VPopup(uiModel: uiModel, isPresented: isPresented, content: { self }, view: popupView)
    }
}
