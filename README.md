# SwiftUIDevKit
A Quick Development Kit for iOS Applications. 

## Installation
Go to Xcode, 

File > Add Package Dependencies then search the url & add SwiftUIDevKit package.

***

### VTextField
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

#### 1. To set header/footer to textfield.
![VTextField_Header/Footer](https://github.com/i-steve/SwiftUIDevKit/assets/81131990/947d22e8-b7c7-4a63-b903-2b0e3ed456fc)

You can set header/footer to textfield, set to nil if you want to remove.

```
    VTextField("Email",
                text: $email,
                header: "Enter Email",
                footer: "Invalid Email")
```


#### 2. To create icon on textfield.
![VTextField_Icon](https://github.com/i-steve/SwiftUIDevKit/assets/81131990/65ecde42-da1a-4782-b501-a2c7525c8172)

Set Image, Alignment (whether leading/trailing, action. if there is no need of action pass nil.

```
    VTextField("Email",
                text: $email,
                icon: (Image(systemName: "envelope.fill"), .trailing, nil))
```


#### 3. To make SecureEntry over textField.

![VTextField_SecureEntry](https://github.com/vishnuo-o/SwiftUIDevKit/assets/81131990/317d57f6-c681-434c-9d44-978a1c11d8d9)


Set the 'secureEntry' param true. By Default set to false.

```
    VTextField("Password", text: $password, secureEntry: true)
```

#### 4. To make mandatory textField.

![VTextField_Mandatory](https://github.com/vishnuo-o/SwiftUIDevKit/assets/81131990/f4434308-87f4-4784-b4d4-d2f00544f74a)

Set the 'mandatory' param true. By Default set to false.

```
    VTextField("Email", text: $email, mandatory: true)
```

#### 5. To make text formatting.

![VTextField_Formatting](https://github.com/vishnuo-o/SwiftUIDevKit/assets/81131990/b0c8dde4-d0ca-42f0-8a07-21a822e2d5fb)


Set the 'format' param to masking string.

```
    VTextField("Phone", text: $phone, format: "(XXX) XXX-XXXX")
```

## To Customise the textfield style.
![VTextField_Customise](https://github.com/i-steve/SwiftUIDevKit/assets/81131990/3041d21a-eb86-4e9c-87c8-60df3acb0388)

Create an object of VTextFieldUIModel and pass the object to 'uiModel' param.

```
    @State var email: String = ""
    let textFieldUIModel = VTextFieldUIModel(font: .custom("SF Mono", size: 16),
                                             backgroundColor: .green.opacity(0.30),
                                             floatBackgroundColor: .green.opacity(0.30),
                                             selectedColor: .green,
                                             borderWidth: 0,
                                             headerFont: .title,
                                             footerForgroundColor: .yellow)
    
    var body: some View {
        VStack {
            VTextField(uiModel: textFieldUIModel,
                       "Email",
                       text: $email,
                       header: "Login",
                       icon: (Image(systemName: "envelope.fill"), .trailing, nil),
                       footer: "Your are not registered with us")
        }
        .padding()
    }
```

