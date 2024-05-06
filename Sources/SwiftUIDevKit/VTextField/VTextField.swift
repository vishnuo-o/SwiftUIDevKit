//
//  File.swift
//
//  Created by VISHNU on 4/12/24.
//

import SwiftUI

// MARK: - Custom TextField
@available(iOS 13.0, *)
public struct VTextField: View {
    var title: String
    @Binding private var text: String
    @State private var isFocused: Bool = false
    @State private var isVisible: Bool = false
    
    ///UI model
    private let uiModel: VTextFieldUIModel
    
    private let mandatory: Bool
    private let secureEntry: Bool
    private let header: String?
    private let icon: (Image, Alignment, (() -> Void)?)?
    private let footer: String?
    private let maxCount: Int?
    private let format: String?
    
    public init(
        uiModel: VTextFieldUIModel = VTextFieldUIModel(),
        _ title: String,
        text: Binding<String>,
        mandatory: Bool? = nil,
        secureEntry: Bool? = nil,
        header: String? = nil,
        icon: (Image, Alignment, (() -> Void)?)? = nil,
        footer: String? = nil,
        maxCount: Int? = nil,
        format: String? = nil
    ){
        self.uiModel = uiModel
        self.title = title
        self._text = text
        self.mandatory = mandatory ?? false
        self.secureEntry = secureEntry ?? false
        self.header = header
        self.icon = icon
        self.footer = footer
        self.maxCount = maxCount
        self.format = format
    }
    
    public var body: some View{
        TextFieldView()
            .autocorrectionDisabled()
            .keyboardType(.asciiCapable) /// This avoids suggestions bar on the keyboard.
            .foregroundColor(uiModel.foregroundColor)
            .font(uiModel.font)
            .padding(8)
            .frame(height: uiModel.height)
            .padding(.leading, uiModel.placeholderLeadingSpacing)
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
                    .cornerRadius(uiModel.cornerRadius)
                    .padding(.leading, uiModel.placeholderLeadingSpacing)
                    .padding(.leading, (isFocused || !text.isEmpty) && icon?.1 == .leading ? -uiModel.iconWidth+uiModel.floatLeadingSpacing-6 : 0)
                    .offset(x: 5, y: isFocused || !text.isEmpty ? -uiModel.height/2 : 0)
                , alignment: .leading
            )
            .padding(icon?.1 == .leading ? .leading : .trailing,(icon == nil ? 0 : uiModel.iconWidth)) //icon
            .padding(.trailing, uiModel.showClearButton ? uiModel.clearButtonWidth + 3 : 0)
            .padding(.trailing, secureEntry ? uiModel.iconWidth : 0)
            .overlay(
                ZStack{
                    ///Secure Field
                    if secureEntry{
                        HStack{
                            Spacer()
                            Button{
                                isVisible.toggle()
                            }label: {
                                Image(systemName: isVisible ? "eye.slash.fill" : "eye.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: uiModel.iconWidth, height: uiModel.iconHeight)
                                    .padding(.horizontal, 8)
                                    .foregroundColor(isFocused ? uiModel.selectedColor : uiModel.unselectedColor)
                            }
                        }
                    }else{
                        ///Set Icon
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
                        
                        ///Clear Button
                        if uiModel.showClearButton && !text.isEmpty && isFocused{
                            HStack{
                                Spacer()
                                Button{
                                    text = ""
                                }label: {
                                    Image(systemName: "xmark.circle.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: uiModel.clearButtonWidth)
                                        .padding(.horizontal, 8)
                                        .foregroundColor(Color(.placeholderText))
                                }
                                .padding(.trailing, icon?.1 == .trailing ? 30 : 0)
                            }
                        }
                        
                    }
                }
            )
            .background(
                /// Border
                Group {
                    switch uiModel.borderType {
                    case .outline:
                        RoundedRectangle(cornerRadius: uiModel.cornerRadius)
                            .fill(isFocused ? uiModel.selectedBackgroundColor : uiModel.backgroundColor)
                            .background(
                                RoundedRectangle(cornerRadius: uiModel.cornerRadius)
                                    .stroke(isFocused ? uiModel.selectedColor : uiModel.unselectedColor, lineWidth: uiModel.borderWidth * (text.isEmpty ? 1 : 2))
                            )
                    case .underline:
                        VStack(spacing: 0){
                            Spacer()
                            Rectangle()
                                .frame(height: uiModel.borderWidth * (text.isEmpty ? 0.5 : 1.0))
                                .foregroundColor(isFocused ? uiModel.selectedColor : uiModel.unselectedColor)
                                .alignmentGuide(.bottom) { $0[VerticalAlignment.bottom] }
                        }
                    }
                }
            )
        ///Header
            .setHeader(text: header, font: uiModel.headerFont, textColor: uiModel.headerForgroundColor, spacing: uiModel.headerSpacing)
        ///Footer
            .setFooter(text: footer, font: uiModel.footerFont, textColor: uiModel.footerForgroundColor, spacing: uiModel.footerSpacing)
            .padding(.top, 8)        
    }
    
    ///View returns TextField
    private func TextFieldView() -> AnyView{
        //TO DO: - Constraint Issue
        if secureEntry && !isVisible{
            return AnyView(SecureField("", text: $text))
        }else{
            return AnyView(TextField("", text: $text, onEditingChanged: { editing in
                self.isFocused = editing
            })
                .onChange(of: text){ newText in
                    ///Limit text entry
                    if let maxCount{
                        let s = String(newText.prefix(maxCount))
                        if text != s && (maxCount != 0) {
                            text = s
                        }
                    }
                    ///Formatter
                    if let format{
                        text = maskInput(mask: format, input: newText)
                    }
                }
            )
        }
    }
    
    // TO DO:- 
    ///Info View : Pass symbols like  ✔ ,  ✘ ,  𝐢
    private func InfoView(symbol: String = "!", foregroundColor: Color = .white, backgroundColor: Color = .red) -> AnyView{
        return AnyView(
            ZStack{
                Circle()
                    .frame(width: 16)
                    .foregroundColor(backgroundColor)
                Text(symbol)
                    .font(uiModel.footerFont)
                    .foregroundColor(foregroundColor)
                    .clipped()
            })
    }
    
    private func getDot(n: Int) -> String{
        var x = ""
        for _ in 0..<n{
            x.append("•")
        }
        return x
    }
}

///Border fill type
public enum BorderType: String {
    case outline
    case underline
}





//MARK: - Preview
struct CustomTextField_Previews: PreviewProvider {
    @State static var email = "abc@abc.com"
    @State static var pass = "xyz"
    @State static var phone = "123"
    static var previews: some View {
        ///Customize here
        let uiModel = VTextFieldUIModel(
            selectedColor: Color(66, 133, 244),
            borderType: .underline,
            headerFont: .title2
        )
        
        ///Email Password Preview
        VStack{
            VTextField(uiModel: uiModel,
                       "Email or phone",
                       text: $email,
                       mandatory: true,
                       header: "Login",
                       icon: (Image(systemName: "envelope.fill"), .leading, nil),
                       footer: nil
            )
            VTextField("Password", text: $pass, secureEntry: true)
            VTextField("Phone", text: $phone, maxCount: 1, format: "(XXX) XXX-XXXX")
        }
        .padding()
    }
}
