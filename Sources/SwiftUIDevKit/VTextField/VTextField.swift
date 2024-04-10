//
//  File.swift
//  
//
//  Created by STS649-VISHNU S on 4/10/24.
//

import SwiftUI

@available(iOS 13.0, *)
public struct VTextField: View {
    
    var title: String
    
    @Binding private var text: String
    @State private var isFocused: Bool = false
    
    ///UI model
    let uiModel: VTextFieldUIModel
    
    private var mandatory: Bool
    private var header: String?
    private var icon: (Image, Alignment, (() -> Void)?)?
    private var footer: String?
    
    public init(uiModel: VTextFieldUIModel = VTextFieldUIModel(),
         _ title: String,
         text: Binding<String>,
         mandatory: Bool? = nil,
         header: String? = nil,
         icon: (Image, Alignment, (() -> Void)?)? = nil,
         footer: String? = nil
    ){
        self.uiModel = uiModel
        self.title = title
        self._text = text
        self.mandatory = mandatory ?? false
        self.header = header
        self.icon = icon
        self.footer = footer
    }
    
    public var body: some View {
        TextField("", text: $text, onEditingChanged: { editing in
            self.isFocused = editing
        })
        .autocorrectionDisabled()
        .foregroundColor(uiModel.foregroundColor)
        .font(uiModel.font)
        .padding(8)
        .frame(height: uiModel.height)
        .padding(.leading, 4)
        .background(
            ///Float Title
            HStack(spacing: 0){
                Text(" \(title) ")
                    .foregroundColor(isFocused ? uiModel.selectedColor : uiModel.unselectedColor)
                if mandatory{
                    Text("* ")
                        .foregroundColor(.red)
                }
            }
                .font(isFocused || !text.isEmpty ? uiModel.floatFont : uiModel.placeholderFont)
                .background(isFocused || !text.isEmpty ? uiModel.floatBackgroundColor : .clear)
                .cornerRadius(uiModel.cornerRadius/2)
                .offset(x: 8, y: isFocused || !text.isEmpty ? -uiModel.height/2 : 0), alignment: .leading)
        .padding(icon?.1 == .leading ? .leading : .trailing,(icon == nil ? 0 : uiModel.iconWidth))
        .overlay(
            ///Image
            ZStack{
                if let image = icon?.0{
                    HStack{
                        icon?.1 == .trailing ? Spacer() : nil
                        Button{
                            if let action = icon?.2{
                                action()
                            }
                        }label: {
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: uiModel.iconWidth, height: uiModel.iconHeight)
                                .padding(.horizontal, 8)
                                .foregroundColor(isFocused ? uiModel.selectedColor : uiModel.unselectedColor)
                        }
                        .allowsHitTesting(icon?.2 != nil)
                        icon?.1 == .leading ? Spacer() : nil
                    }
                }
            }
        )
        .background(
            ///Border
            RoundedRectangle(cornerRadius: uiModel.cornerRadius)
                .fill(uiModel.backgroundColor)
                .background(
                    RoundedRectangle(cornerRadius: uiModel.cornerRadius)
                        .stroke(isFocused ? uiModel.selectedColor : uiModel.unselectedColor, lineWidth: uiModel.borderWidth * (text.isEmpty ? 1 : 2))
                )
        )
        ///Header
        .setHeader(text: header, font: uiModel.headerFont, textColor: uiModel.headerForgroundColor, spacing: uiModel.headerSpacing)
        ///Footer
        .setFooter(text: footer, font: uiModel.footerFont, textColor: uiModel.footerForgroundColor, spacing: uiModel.footerSpacing)
        .padding(.top, 8)
    }
}

//Preview
struct CustomTextField_Previews: PreviewProvider {
    @State static var email = ""
    @State static var pass = ""
    static var previews: some View {
        ///Customize here
        let uiModel = VTextFieldUIModel(selectedColor: .orange, headerFont: .title2)
        
        ///Email Password Preview
        VStack{
            VTextField(uiModel: uiModel,
                       "Email or phone",
                       text: $email,
                       header: "Login",
                       icon: (Image(systemName: "envelope.fill"), .trailing, nil),
                       footer: "Invalid Email"
            )
            VTextField("Password", text: $pass)
        }
        .padding()
    }
}

