//
//  Login_Page.swift
//  Avocarbo
//
//  Created by 安塞尔 陈 on 2023-03-29.
//

import SwiftUI

struct Signup_Page: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var confirm: String = ""
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

TextField("Confirm", text: $password)
                        .multilineTextAlignment(.center)
                        .frame(width:350,height:40).overlay(RoundedRectangle(cornerRadius:10)
                            .stroke(Color.gray,lineWidth:1))

                    Spacer()
                        .frame(height:100)
                    NavigationLink(destination: Policy_Page()){
                        Text("SIGN UP")
                            .foregroundColor(.white)
                            .frame(width:350,height:40)
                            .background(Color.green)
                            .cornerRadius(10)
                            .bold()
                        
                    }
                    Spacer().frame(height:100)

                }
            }.navigationBarHidden(true)
        }
    
}
struct Signup_Page_Previews: PreviewProvider {
    static var previews: some View {
        Signup_Page()
    }
}


