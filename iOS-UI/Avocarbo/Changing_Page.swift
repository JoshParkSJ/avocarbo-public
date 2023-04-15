//
//  Changing_Page.swift
//  Avocarbo
//
//  Created by 安塞尔 陈 on 2023-04-05.
//
import SwiftUI

struct Changing_Page: View {
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
                        .frame(width:350,height:40).overlay(RoundedRectangle(cornerRadius:10)
                            .stroke(Color.gray,lineWidth:1))
                    TextField("Password", text: $password)
                        .frame(width:350,height:40).overlay(RoundedRectangle(cornerRadius:10)
                            .stroke(Color.gray,lineWidth:1))

                    TextField("Confirm", text: $confirm)
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


struct Changing_Page_Previews: PreviewProvider {
    static var previews: some View {
        Changing_Page()
    }
}

