# SwiftUIDevKit
A Quick Development Kit for iOS Applications. 

1.[VTextField](#vtextfield)

2.[VButton](#vbutton)

## Installation
Go to Xcode, 

File > Add Package Dependencies then search the url & add SwiftUIDevKit package.

***

### <a name="vtextfield"></a>VTextField
![VTextField](https://github.com/i-steve/SwiftUIDevKit/assets/81131990/d5e18e88-efb6-46b7-8590-7017f6368593)

#### Usage:
```
    @State var email: String = ""
    var body: some View {
        VStack {
            VTextField("Email", text:$email)
        }
        .padding()
    }
```

#### 1. To create icon on textfield.
![VTextField_Icon](https://github.com/i-steve/SwiftUIDevKit/assets/81131990/65ecde42-da1a-4782-b501-a2c7525c8172)

Set Image, Alignment (whether leading/trailing, action. if there is no need of action pass nil.

```
    VTextField("Email",
                text: $email,
                icon: (Image(systemName: "envelope.fill"), .trailing, nil))
```


#### 2. To make SecureEntry over textField.

![VTextField_SecureEntry](https://github.com/vishnuo-o/SwiftUIDevKit/assets/81131990/317d57f6-c681-434c-9d44-978a1c11d8d9)


Set the 'secureEntry' param true. By Default set to false.

```
    VTextField("Password", text: $password, secureEntry: true)
```

#### 3. To set header/footer to textfield.
![VTextField_Header/Footer](https://github.com/i-steve/SwiftUIDevKit/assets/81131990/947d22e8-b7c7-4a63-b903-2b0e3ed456fc)

You can set header/footer to textfield, set to nil if you want to remove.

```
    VTextField("Email",
                text: $email,
                header: "Enter Email",
                footer: "Invalid Email")
```

#### 4. To make mandatory textField.

![VTextField_Mandatory](https://github.com/vishnuo-o/SwiftUIDevKit/assets/81131990/f4434308-87f4-4784-b4d4-d2f00544f74a)

Set the 'mandatory' param true. By default set to false.

```
    VTextField("Email", text: $email, mandatory: true)
```

#### 5. To make text formatting.

![VTextField_Formatting](https://github.com/vishnuo-o/SwiftUIDevKit/assets/81131990/b0c8dde4-d0ca-42f0-8a07-21a822e2d5fb)


Set the 'format' param to masking string. Use X to create mask.

```
    VTextField("Phone", text: $phone, format: "(XXX) XXX-XXXX")
```

#### 6. To limit the input.

![VTextField_Limit](https://github.com/vishnuo-o/SwiftUIDevKit/assets/81131990/91ec2e04-7209-43af-be94-ef9cc9ca4e29)

Set the 'maxCount' param to required maximum count.

```
    VTextField("Username", text: $username, maxCount: 6)
```

#### 7. To change border type.

![VTextField_BorderType](https://github.com/vishnuo-o/SwiftUIDevKit/assets/81131990/7b8c853e-2bd3-4a81-aa1d-ed7e9f608dfb)

Make a uiModel with following params.

```
    let textFieldUIModel = VTextFieldUIModel(borderType: .underline, placeholderLeadingSpacing: -6)
```

### To Customise the textfield for any style.
![VTextField_Custom](https://github.com/vishnuo-o/SwiftUIDevKit/assets/81131990/fda9ce69-9ab0-4123-bd72-ae78e37fdd62)

Create an object of VTextFieldUIModel and pass the object to 'uiModel' param.

```
    @State var username: String = ""
    let textFieldUIModel = VTextFieldUIModel(font: .custom("Menlo", size: 14),
                                             backgroundColor: .gray.opacity(0.25),
                                             selectedBackgroundColor: .green.opacity(0.25),
                                             floatBackgroundColor: Color(200,240,215),
                                             selectedColor: .green,
                                             borderWidth: 0,
                                             borderType: .outline,
                                             headerFont: .title,
                                             footerForgroundColor: .red)
    
    var body: some View {
        VStack {
             VTextField(uiModel: textFieldUIModel,
                        "User Name",
                        text: $username,
                        mandatory: true)
        }
        .padding()
    }
```

***

### <a name="vbutton"></a>VButton

Similer to TextField, you can customize the uiModel as required.
You can explore the properties.
![VButton](https://github.com/vishnuo-o/SwiftUIDevKit/assets/81131990/4219edf2-f4f9-4030-863e-621ebd32da49)

```
    let primaryButton = VButtonUIModel(font: .custom("Avenir Heavy", size: 20),
                                       backgroundColor: .green,
                                       icon: (Image(systemName: "arrowshape.right.fill"), .trailing))
    
    let secondaryButton = VButtonUIModel(font: .custom("Avenir Heavy", size: 20),
                                         backgroundColor: .orange,
                                         fill: .proportional,
                                         height: 36,
                                         cornerRadius: 5.0,
                                         icon: (Image(systemName: "plus.circle.fill"), .leading))

    VButton(uiModel: primaryButton, title: "Next") {
        // action
    }
    
    VButton(uiModel: secondaryButton, title: "Add") {
        // action
    }
```
