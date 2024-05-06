//
//  Extension+View.swift
//  VKit
//
//  Created by VISHNU on 4/12/24.
//

import SwiftUI

// MARK: - Extension for View
extension View {
    // MARK: - Header
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
    
    // MARK: - Footer
    public func setFooter(text: String?, font: Font, textColor: Color, spacing: CGFloat, info: AnyView? = nil) -> some View {
        VStack(alignment: .leading, spacing: spacing){
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
    public func presentView<PopupView>(uiModel: VPopupUIModel, isPresented: Bool, popupView: @escaping() -> PopupView) -> some View where PopupView: View {
        return VPopup(uiModel: uiModel, isPresented: isPresented, content: { self }, view: popupView)
    }
}
