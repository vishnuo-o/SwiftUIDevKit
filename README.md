# SwiftUIDevKit
A Quick Development Kit for iOS Applications. 
***
## VTextField
![VTextField](https://github.com/i-steve/SwiftUIDevKit/assets/81131990/d5e18e88-efb6-46b7-8590-7017f6368593)

### Usage:
```
    @State var email: String = ""
    var body: some View {
        VStack {
            VTextField("Email", text:$viewModel.email)
        }
        .padding()
    }
```

#### 1. To set header/footer to textfield.
![VTextField_Header/Footer](https://github.com/i-steve/SwiftUIDevKit/assets/81131990/947d22e8-b7c7-4a63-b903-2b0e3ed456fc)

```
    VTextField("Email",
                text: $viewModel.email,
                header: "Enter Email",
                footer: "Invalid Email")
```


#### 2. To set icon to textfield.
![VTextField_Icon](https://github.com/i-steve/SwiftUIDevKit/assets/81131990/65ecde42-da1a-4782-b501-a2c7525c8172)

```
    VTextField("Email",
                text: $viewModel.email,
                icon: (Image(systemName: "envelope.fill"), .trailing, nil))
```

#### 3. To Customise the textfield style.
![VTextField_Customise](https://github.com/i-steve/SwiftUIDevKit/assets/81131990/3041d21a-eb86-4e9c-87c8-60df3acb0388)

```
    @State var email: String = ""
    let textFieldUIModel = VTextFieldUIModel(font: .custom("SF Mono", size: 16),
                                             backgroundColor: .green.opacity(0.30),
                                             floatBackgroundColor: .green,
                                             selectedColor: .green,
                                             borderWidth: 0,
                                             headerFont: .title,
                                             footerForgroundColor: .yellow)
    
    var body: some View {
        VStack {
            VTextField(uiModel: textFieldUIModel,
                       "Email",
                       text: $viewModel.email,
                       header: "Login",
                       icon: (Image(systemName: "envelope.fill"), .trailing, nil),
                       footer: "Your are not registered with us")
        }
        .padding()
    }
```
