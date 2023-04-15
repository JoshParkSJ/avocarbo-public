//
//  Setting_Page.swift
//  Avocarbo
//
//  Created by 安塞尔 陈 on 2023-04-05.
//

import SwiftUI

struct Setting_Page: View {
    var body: some View {
        NavigationView{
            VStack{
                Spacer().frame(height:50)
                HStack{
                    Text("SETTINGS")
                        .font(.system(size:32))
                    Image(systemName: "gearshape")
                        .resizable()
                        .frame(width:50,height:50)
                    Spacer().frame(width:130)
                }
                Spacer().frame(height:50)
                Group{
                    VStack{
                        Group{ HStack{
                           
                                Text("NOTIFICATION")
                                    .font(.system(size:20))
                                    .frame(width:350)
                                    .foregroundColor(.black)
                                Spacer().frame(width:200)
                            
                        }
                            
                            Text("_____________________________________")}
                        Spacer().frame(height:20)
                        
                        Group{ HStack{
                            NavigationLink(destination: Language_Page()){
                                Text("LANGUAGE")
                                    .font(.system(size:20))
                                    .frame(width:350)
                                    .foregroundColor(.black)
                                Spacer().frame(width:225)
                            }
                        }
                            
                            Text("_____________________________________")}
                        Spacer().frame(height:20)
                        Group{ HStack{
                            NavigationLink(destination: Connect_Page()){
                                Text("CONNECT TO OTHER APPS")
                                    .font(.system(size:20))
                                    .frame(width:350)
                                    .foregroundColor(.black)
                                Spacer().frame(width:90)
                            }
                        }
                            Text("_____________________________________")}
                        Spacer().frame(height:20)
                        Group{ HStack{
                            NavigationLink(destination: Changing_Page()){
                                Text("CHANGE EMAIL / PASSWORD")
                                    .font(.system(size:20))
                                    .frame(width:350)
                                    .foregroundColor(.black)
                                Spacer().frame(width:74)
                            }
                        }
                            Text("_____________________________________")}
                        Spacer().frame(height:20)

                        
                    }

                }
                Spacer()
                NavigationLink(destination: Profile_Page()){
                    Text("PROFILE")
                        .font(.system(size:25))
                        .frame(width:350)
                        .foregroundColor(.black)
                        .overlay(RoundedRectangle(cornerRadius:20)
                            .stroke(Color.black,lineWidth:1))
                }
            }
            
            
            
            }.navigationBarHidden(true)
        }
    
}

struct Setting_Page_Previews: PreviewProvider {
    static var previews: some View {
        Setting_Page()
    }
}
