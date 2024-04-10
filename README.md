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
