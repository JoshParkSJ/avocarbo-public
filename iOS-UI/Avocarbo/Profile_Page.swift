//
//  Profile_Page.swift
//  Avocarbo
//
//  Created by 安塞尔 陈 on 2023-03-29.
//

import SwiftUI

struct Profile_Page: View {
    var body: some View {
        NavigationView{
            VStack{
                Spacer().frame(height:30)
                Group{HStack{
                    Image("user")
                    Spacer().frame(width:200)
                }
                    HStack{
                        Text("Adam Smith")
                            .bold()
                            .font(.system(size:25))
                            .foregroundColor(.green)
                        Spacer().frame(width:190)
                    }
                    Spacer().frame(height:20)
                    HStack{
                        Text("Email:adamsmith@gmail.com")
                            .font(.system(size:20))
                        Spacer().frame(width:70)
                    }
                }
                
                Spacer().frame(height:200)
                NavigationLink(destination: Setting_Page()){
                    Text("SETTING")
                        .font(.system(size:25))
                        .foregroundColor(.black)
                        Image(systemName: "gearshape.fill")
                        .foregroundColor(.black)
                }.frame(width:350,height:50)
                    .overlay(RoundedRectangle(cornerRadius:20)
                        .stroke(Color.black,lineWidth:1))
                Spacer().frame(height:30)
                HStack{
                    Link(destination: URL(string: "https://www.termsfeed.com/live/e41b1e1b-5e84-4412-96b6-34d7b32e79ae")!) {
                        Text("PRIVACY POLICY")
                            .font(.system(size:25))
                            .foregroundColor(.black)
   
                    }
                    Image(systemName: "checkmark.shield.fill")
                } .frame(width:350,height:50)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth:1))
                Spacer().frame(height:30)
                HStack{
                    Text("LOG OUT")
                        .font(.system(size:25))
                       
                    Image(systemName: "arrow.left.circle")
                } .frame(width:350,height:50)
                    .overlay(RoundedRectangle(cornerRadius:20)
                        .stroke(Color.black,lineWidth:1))
                
                
                Spacer()
            }
        }.navigationBarHidden(true)
        }
}

struct Profile_Page_Previews: PreviewProvider {
    static var previews: some View {
        Profile_Page()
    }
}
