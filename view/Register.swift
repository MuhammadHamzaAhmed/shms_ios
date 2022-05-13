//
//  Register.swift
//  SHMS IOS
//
//  Created by Muhammad Hamza on 11/05/2022.
//

import SwiftUI

struct Register: View {
    
    @State var dob = Date()
    @State var userName = TextFieldData()
    @State var email = TextFieldData()
    @State var password = TextFieldData()
    var body: some View {
        ZStack{
            Rectangle().fill(Color(hex: "11CFC5"))
            VStack{
                Spacer()
                HStack{
                    Text("Here\'s\nyour first\nstep with\nus")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                    Image("login_svg").resizable().frame(width: 230, height: 200)
                }
                ZStack{
                    Rectangle()
                        .fill(Color(.white))
                        .frame(height: 500.0)
                        .cornerRadius(10)
                        .padding([.leading, .bottom, .trailing], 30)
                    VStack{
                        EditText(text:userName, displayText: "User Name", displayImg: "person.crop.circle.fill").padding(.horizontal)
                            .padding(.vertical, -10)
                        EditText(text:email, displayText: "Email", displayImg: "envelope.fill")
                            .padding(.horizontal)
                            .padding(.vertical, -10)
                        EditText(text:password, displayText: "Password", displayImg: "lock.fill")
                            .padding(.horizontal)
                            .padding(.vertical, -10)
                        DatePicker("Date Of Birth", selection: $dob, in: ...Date(), displayedComponents: .date)
                            .padding(.horizontal, 45)
                            .foregroundColor(Color(hex: "11CFC5"))
                            .padding(.vertical, 10)
                        GenderRadioButton(){
                            selected in
                        }.padding(.horizontal, 45)
                        Button(action: {}, label: {
                            ZStack{
                                Rectangle()
                                    .fill(Color(hex: "11CFC5"))
                                    .frame(width: 200, height: 60)
                                    .cornerRadius(30)
                                    
                                Text("Register").font(.title2).fontWeight(.bold).foregroundColor(.white)
                            }
                        })
                        Button(action: {}, label: {
                                Text("Already Have an account?")
                                .font(.title2).fontWeight(.bold)
                                .foregroundColor(Color(hex: "11CFC5"))
                            }
                        )
                    }
                }
                Spacer()
            }
        }
        .ignoresSafeArea()
        .background(Color(hex: "11CFC5"))
        
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}

struct RadioButton:View{
    let id : String
    let label : String
    let size : CGFloat
    let color : Color
    let textSize : CGFloat
    let isMarked : Bool
    let callBack : (String) -> ()
    
    init(
        id: String,
        label: String,
        size: CGFloat=20,
        color: Color = Color(hex: "11CFC5"),
        textSize: CGFloat = 14,
        isMarked: Bool = false,
        callBack: @escaping (String) -> ()
    ){
        self.id = id
        self.label = label
        self.size = size
        self.color = color
        self.textSize = textSize
        self.isMarked = isMarked
        self.callBack = callBack
    }
    
    var body: some View{
        Button(action: {
            self.callBack(self.id)
        }) {
            HStack(alignment: .center, spacing: 10){
                Image(systemName: self.isMarked ? "largecircle.fill.circle" : "circle")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.size, height: self.size)
                    .foregroundColor(.black)
                Text(self.label)
                    .font(Font.system(size: self.size)).foregroundColor(self.color)
                Spacer()
            }
        }
    }
}

enum Gender:String{
    case male = "Male"
    case female = "Female"
    case other = "Other"
}

struct GenderRadioButton:View{
    
    let callBack: (String) -> ()
    
    @State var selectedId: String = ""
    
    var body: some View{
        HStack{
            radioMaleMajority
            radioFemaleMajority
            radioOtherMajority
        }
    }
    
    var radioMaleMajority: some View{
        RadioButton(
            id: Gender.male.rawValue,
            label: Gender.male.rawValue,
            isMarked: selectedId == Gender.male.rawValue ? true : false,
            callBack: radioGroupCallback
        )
    }
    
    var radioFemaleMajority: some View{
        RadioButton(
            id: Gender.female.rawValue,
            label: Gender.female.rawValue,
            isMarked: selectedId == Gender.female.rawValue ? true : false,
            callBack: radioGroupCallback
        )
    }
    
    var radioOtherMajority: some View{
        RadioButton(
            id: Gender.other.rawValue,
            label: Gender.other.rawValue,
            isMarked: selectedId == Gender.other.rawValue ? true : false,
            callBack: radioGroupCallback
        )
    }
    
    func radioGroupCallback(id: String){
        selectedId = id
        callBack(id)
    }
}
