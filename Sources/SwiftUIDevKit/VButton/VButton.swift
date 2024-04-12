//
//  File.swift
//  
//
//  Created by VISHNU on on 4/12/24.
//

import SwiftUI

// MARK: - Button Style
public struct CustomButtonStyle: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .foregroundStyle(.white)
            .bold()
            .font(.title3)
            .background(Color(red: 66/255, green: 133/255, blue: 244/255))
            .cornerRadius(8)
            .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0), value: true) // Spring animation
            .padding(.top, 10)
    }
}

/// Primary Button Style Streched
extension ButtonStyle where Self == CustomButtonStyle {
    public static var primary: CustomButtonStyle {
        CustomButtonStyle()
    }
}
