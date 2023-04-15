//
//  Main_Page.swift
//  Avocarbo
//
//  Created by 安塞尔 陈 on 2023-03-29.
//

import SwiftUI

struct Main_Page: View {
    @State var username: String = ""
    @State var password: String = ""
    var body: some View {
            NavigationView{
                
                VStack{
                    Image("title")
                    Image("logo")
                    Spacer().frame(height:50)
                    TextField("Email", text: $username)
                        .multilineTextAlignment(.center)
                        .frame(width:350,height:40).overlay(RoundedRectangle(cornerRadius:10)
                            .stroke(Color.gray,lineWidth:1))
                    TextField("Password", text: $password)
                        .multilineTextAlignment(.center)
                        .frame(width:350,height:40).overlay(RoundedRectangle(cornerRadius:10)
                            .stroke(Color.gray,lineWidth:1))
                    Spacer()
                        .frame(height:100)
                    NavigationLink(destination: Content_Page()){
                        Text("LOG IN")
                            .foregroundColor(.white)
                            .frame(width:350,height:40)
                            .background(Color.green)
                            .cornerRadius(10)
                            .bold()
                        
                    }
                    Spacer().frame(height:100)
                    HStack{
                        Text("Don't have an account?")
                        
                        NavigationLink(destination: Signup_Page()){
                            Text("SIGN UP")
                                .foregroundColor(.green)
                                .bold()
                        }
                        
                    }
                }
            }.navigationBarHidden(true)
        }
}

struct Main_Page_Previews: PreviewProvider {
    static var previews: some View {
        Main_Page()
    }
}

