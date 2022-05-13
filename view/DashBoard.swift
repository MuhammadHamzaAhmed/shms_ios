//
//  DashBoard.swift
//  SHMS IOS
//
//  Created by Muhammad Hamza on 11/05/2022.
//

import SwiftUI

struct DashBoard: View {
    var body: some View {
        ZStack{
            Image("background").resizable()
            VStack{
                VStack(alignment: .center){
                    Text("Muhammad Hamza")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                    Image("Hamza")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .cornerRadius(150)
                }.padding(.top, 50)
                ScrollView{
                    HStack(spacing: 10){
                        ZStack{
                            Rectangle()
                                .frame(width: 180, height: 200)
                                .opacity(0.5)
                                .shadow(radius: 5)
                                .cornerRadius(20)
                            VStack{
                                Image("bp")
                                    .resizable()
                                    .padding(.horizontal)
                                Spacer()
                                Text("Health\nMonitoring")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom)
                            }
                        }
                        ZStack{
                            Rectangle()
                                .frame(width: 180, height: 200)
                                .opacity(0.5)
                                .shadow(radius: 5)
                                .cornerRadius(20)
                            VStack{
                                Image("bp")
                                    .resizable()
                                    .padding(.horizontal)
                                Spacer()
                                Text("Heart Attack")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom)
                            }
                        }
                    }.padding(.bottom, 10)
                        .padding(.horizontal, 30)
                    HStack(spacing: 10){
                        ZStack{
                            Rectangle()
                                .frame(width: 180, height: 200)
                                .opacity(0.5)
                                .shadow(radius: 5)
                                .cornerRadius(20)
                            VStack{
                                Image("bp")
                                    .resizable()
                                    .padding(.horizontal)
                                Spacer()
                                Text("Diabetes")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom)
                            }
                        }
                        ZStack{
                            Rectangle()
                                .frame(width: 180, height: 200)
                                .opacity(0.5)
                                .shadow(radius: 5)
                                .cornerRadius(20)
                            VStack{
                                Image("bp")
                                    .resizable()
                                    .padding(.horizontal)
                                Spacer()
                                Text("Tonsil")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom)
                            }
                        }
                    }.padding(.bottom, 10)
                        .padding(.horizontal, 30)
                    ZStack{
                        Rectangle()
                            .frame(width: 180, height: 200)
                            .opacity(0.5)
                            .shadow(radius: 5)
                            .cornerRadius(20)
                        VStack{
                            Image("bp")
                                .resizable()
                                .frame(width: 150, height: 150)
                                .padding(.horizontal)
                            Spacer()
                            Text("Settings")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                                .padding(.bottom)
                        }
                    }
                }
                Spacer()
            }
        }.ignoresSafeArea()
    }
}

struct DashBoard_Previews: PreviewProvider {
    static var previews: some View {
        DashBoard()
    }
}
