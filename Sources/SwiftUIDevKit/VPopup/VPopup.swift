//
//  VPopup.swift
//  VKitDemo
//
//  Created by STS649-VISHNU S on 4/23/24.
//

import SwiftUI

// MARK: - VPopup
public struct VPopup<Content, PopupView>: View where Content: View, PopupView: View {
    ///UI model
    private var uiModel: VPopupUIModel
    private var isPresented: Bool
    @ViewBuilder let content: () -> Content
    @ViewBuilder let view: () -> PopupView

    public var body: some View {
        ZStack {
            content()
                .overlay(
                    Group {
                        if isPresented {
                            uiModel.shadowColor.ignoresSafeArea()
                            view()
                                .padding(uiModel.padding)
                                .background(uiModel.backgroundColor)
                                .cornerRadius(uiModel.cornerRadius)
                                .overlay(RoundedRectangle(cornerRadius: uiModel.cornerRadius)
                                    .stroke(uiModel.borderColor, lineWidth: uiModel.borderWidth))
                                .transition(uiModel.transition)
                                .shadow(color: uiModel.shadowColor, radius: uiModel.shadowRadius)
                        }
                    }.ignoresSafeArea()
                )
        }
        .animation(uiModel.animation, value: isPresented)
    }
}
