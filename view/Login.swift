//
//  Login.swift
//  SHMS IOS
//
//  Created by Muhammad Hamza on 10/05/2022.
//

import SwiftUI
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
struct Login: View {
    @State var email = TextFieldData()
    @State var pass = TextFieldData()
    @State var showToast = false;
    var body: some View {
        ZStack(){
            HStack{
                Image("sideBar").frame(width: 100, height: 1000);
            }
            VStack(){
                Spacer()
                HStack{
                    Text("Already have\nan Account ")
                        .font(.title)
                        .fontWeight(.heavy)
                    Image("login_svg").resizable().frame(width: 230, height: 200)
                }
                EditText(text:email, displayText:"Email", displayImg: "envelope.fill")
                EditText(text:pass, displayText:"Password", displayImg: "lock.fill", secure: true)
                HStack{
                    Spacer()
                    Button(action: {}, label: {
                        Text("Forgot password")
                            .font(.title3)
                            .foregroundColor(Color(hex:"FF11CFC5"))
                    }).padding(.trailing, 30.0)
                }
                Button(action: {
                    showToast = true;
                }, label: {
                    Image("loginButton").resizable().frame(width:300, height:80)
                })
                HStack{
                    Button(action: {}, label: {
                        Text("New User? Register Now")
                            .font(.title3)
                            .foregroundColor(Color(hex:"FF11CFC5"))
                    })
                }
                HStack{
                    Spacer()
                    Button(action: {}, label: {
                        Image("new_reg").resizable()
                            .padding(.bottom)
                            .frame(width: 75.0, height: 130)
                    })
                }.padding(.bottom, 60.0)
                Spacer()
            }
        }.ignoresSafeArea()
    }
}
struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}

struct EditText: View{
    @State var obj: TextFieldData;
    @State var displayText:String;
    @State var displayImg:String;
    @State var secure:Bool;
    @State var isTapped=false;
    
    init(text: TextFieldData, displayText:String, displayImg:String, secure:Bool = false){
        self.obj = text
        self.displayText = displayText
        self.displayImg = displayImg
        self.secure = secure
    }
    
    var body: some View{
        VStack{
            VStack(alignment: .leading, spacing: 4, content: {
                HStack(spacing:15){
                    Image(systemName: self.displayImg)
                    TextField("", text: $obj.text){(status) in
                        if status{
                            withAnimation(.easeIn){
                                self.isTapped = true
                            }
                        }
                    } onCommit: {
                        if self.obj.text == ""{
                            withAnimation(.easeOut){
                                self.isTapped = false
                            }
                        }
                    }
                    .padding(.top, self.isTapped ? 15 : 0)
                    .background(
                        Text(self.displayText)
                            .scaleEffect(self.isTapped ? 0.8 : 1)
                            .offset(x: self.isTapped ? -7 : 0, y: self.isTapped ? -15 : 0)
                            .foregroundColor(self.isTapped ? Color(hex:"FF11CFC5") : .gray)
                        , alignment: .leading
                    )
                }
                Rectangle()
                    .fill(self.isTapped ? Color(hex:"FF008080") : Color(hex:"FF11CFC5"))
                    .frame(height: self.isTapped ? 3 : 2)
                    
            })
            .padding(.vertical, 12)
            .padding(.horizontal)
            .cornerRadius(5)
        }.padding()
    }
}

class TextFieldData: ObservableObject{
    
    @Published var text = "";
}
