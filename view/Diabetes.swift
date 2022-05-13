//
//  Diabetes.swift
//  SHMS IOS
//
//  Created by Muhammad Hamza on 11/05/2022.
//

import SwiftUI

struct Diabetes: View {
    @State var numOfRecords = 0
    @State var name="Muhammad Hamza"
    var body: some View {
        ZStack{
            Image("background").resizable()
            VStack{
                VStack{
                    Text("")
                }.padding(.top, 20)
            }
        }.ignoresSafeArea()
    }
}

struct Diabetes_Previews: PreviewProvider {
    static var previews: some View {
        Diabetes()
    }
}
