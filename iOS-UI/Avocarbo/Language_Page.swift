//
//  Language_Page.swift
//  Avocarbo
//
//  Created by 安塞尔 陈 on 2023-04-10.
//

import SwiftUI

struct Language_Page: View {
    var body: some View {
        VStack{
            Spacer().frame(height:50)
            HStack{
                Text("LANGUAGE")
                    .font(.system(size:32))
                Image(systemName: "globe")
                    .resizable()
                    .frame(width:50,height:50)
                Spacer().frame(width:130)
            }
            Spacer().frame(height:50)
            Group{
                HStack{
                    Text("English")
                        .font(.system(size:20).bold())
                }.frame(width:350,height:40).overlay(RoundedRectangle(cornerRadius:20)
                    .stroke(Color.black,lineWidth:1))
            }
            
            Group{
                HStack{
                    Text("Français")
                        .font(.system(size:20))
                }.frame(width:350,height:40).overlay(RoundedRectangle(cornerRadius:20)
                    .stroke(Color.black,lineWidth:1))
            }
            
            Group{
                HStack{
                    Text("한국어")
                        .font(.system(size:20))
                }.frame(width:350,height:40).overlay(RoundedRectangle(cornerRadius:20)
                    .stroke(Color.black,lineWidth:1))
            }
            
            Group{
                HStack{
                    Text("Español")
                        .font(.system(size:20))
                }.frame(width:350,height:40).overlay(RoundedRectangle(cornerRadius:20)
                    .stroke(Color.black,lineWidth:1))
            }
            
            Group{
                HStack{
                    Text("简体中文")
                        .font(.system(size:20))
                }.frame(width:350,height:40).overlay(RoundedRectangle(cornerRadius:20)
                    .stroke(Color.black,lineWidth:1))
            }
            
            Group{
                HStack{
                    Text("日本語")
                        .font(.system(size:20))
                }.frame(width:350,height:40).overlay(RoundedRectangle(cornerRadius:20)
                    .stroke(Color.black,lineWidth:1))
            }
            
            Spacer()
        }
    }
}

struct Language_Page_Previews: PreviewProvider {
    static var previews: some View {
        Language_Page()
    }
}
