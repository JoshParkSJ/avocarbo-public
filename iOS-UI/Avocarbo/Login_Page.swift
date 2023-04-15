//
//  Login_Page.swift
//  Avocarbo
//
//  Created by 安塞尔 陈 on 2023-03-29.
//

import SwiftUI

struct Login_Page: View {
    @State var username: String = ""
    @State var password: String = ""
    var body: some View {
        NavigationView{
            
            VStack{
                Text("Your Username:")
                
                TextField("Enter username...", text: $username)
                    .multilineTextAlignment(.center)
                
                Text("Your Password:")
                
                TextField("Enter password...", text: $password)
                    .multilineTextAlignment(.center)
                Spacer()
                    .frame(height:200)
                NavigationLink(destination: Content_Page()){
                    Text("Log In")
                        .frame(width:100,height:35)
                        .background(Color.green)
                        .cornerRadius(100)
                        .bold()
                }
                
            }
            .background(Image("background")
                .resizable()
                .opacity(0.5)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .edgesIgnoringSafeArea(.all))
        }.navigationBarHidden(true)
    }
    
}
struct Login_Page_Previews: PreviewProvider {
    static var previews: some View {
        Login_Page()
    }
}
