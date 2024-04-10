//
//  File.swift
//
//  Created by STS649-VISHNU S on 4/10/24.
//

import SwiftUI

@available(iOS 13.0, *)
public struct VTextField: View {
    var title: String
    @Binding private var text: String
    @State private var isFocused: Bool = false
    @State private var isVisible: Bool = false
    
    ///UI model
    let uiModel: VTextFieldUIModel
    
    private var mandatory: Bool
    private var secureEntry: Bool
    private var header: String?
    private var icon: (Image, Alignment, (() -> Void)?)?
    private var footer: String?
    private var maxCount: Int?
    private var format: Format
    
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
        format: Format = .none
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
    
    public var body: some View {
        TextFieldView()
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
                .offset(x: 8, y: isFocused || !text.isEmpty ? -uiModel.height/2 : 0), alignment: .leading
            )
            .padding(icon?.1 == .leading ? .leading : .trailing,(icon == nil ? 0 : uiModel.iconWidth))
            .padding(.trailing, secureEntry ? uiModel.iconWidth : 0)
            .overlay(
                ZStack{
                    ///SecureField
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
    
    ///View returns TextField
    private func TextFieldView() -> AnyView{
        if secureEntry && !isVisible{
            return AnyView(SecureField("", text: $text))
        }else{
            return AnyView(TextField("", text: $text, onEditingChanged: { editing in
                self.isFocused = editing
            })
                .onChange(of: text){ newText in
                    if let maxCount{
                        let s = String(newText.prefix(maxCount))
                        if text != s && (maxCount != 0) {
                            text = s
                        }
                    }else{
                        switch format{
                        case .phone_US:
                            text = phoneFormatter(newText, "US")
                        case .phone_IND:
                            text = phoneFormatter(newText, "IND")
                        case .zipcode_US:
                            text = zipCodeFormatter(newText)
                        case .ein:
                            text = einFormatter(newText)
                        case .ssn:
                            text = ssnFormatter(newText)
                        case .currency_Dollar:
                            text = currencyFormatter(newText)
                        case .none:
                            text = newText
                        }
                    }
                })
        }
    }
    
    // Formatter
    func phoneFormatter(_ phone: String, _ Country: String) -> String {
        var mask = ""
        switch Country{
        case "US":
            mask = "(XXX) XXX-XXXX"
        case "IND":
            mask = "XXXX-XXXXXXX"
        default:
            break
        }
        return maskInput(mask: mask, input: phone)
    }
    
    func zipCodeFormatter(_ zipcode: String) -> String {
        return maskInput(mask: "XXXXX-XXXX", input: zipcode)
    }
    
    func einFormatter(_ ein: String) -> String {
        return maskInput(mask: "XX-XXXXXXX", input: ein)
    }
    
    func ssnFormatter(_ ssn: String) -> String {
        return maskInput(mask: "XXX-XX-XXXX", input: ssn)
    }
    
    func currencyFormatter(_ amount: String) -> String {
        var mask = "$"
        for _ in (0..<amount.count) {
            mask.append("X")
        }
        return maskInput(mask: mask, input: amount)
    }
    
    // Mask method
    func maskInput(mask: String, input: String) -> String {
        let cleanInput = input.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        var result = ""
        var index = cleanInput.startIndex
        for ch in mask where index < cleanInput.endIndex {
            if ch == "X" {
                result.append(cleanInput[index])
                index = cleanInput.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
}

//Preview
struct CustomTextField_Previews: PreviewProvider {
    @State static var email = "abc"
    @State static var pass = "123"
    @State static var phone = ""
    static var previews: some View {
        ///Customize here
        let uiModel = VTextFieldUIModel(selectedColor: Color(red: 66/255, green: 133/255, blue: 244/255), headerFont: .title2)
        
        ///Email Password Preview
        VStack{
            VTextField(uiModel: uiModel,
                       "Email or phone",
                       text: $email,
                       mandatory: true,
                       header: "Login",
                       icon: (Image(systemName: "envelope.fill"), .trailing, nil),
                       footer: ""
            )
            VTextField("Password", text: $pass, secureEntry: true)
            VTextField("Phone", text: $phone, maxCount: 1)
        }
        .padding()
    }
}

public enum Format{
    case none
    case phone_US
    case phone_IND
    case zipcode_US
    case ein
    case ssn
    case currency_Dollar
}
