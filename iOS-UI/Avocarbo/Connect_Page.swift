//
//  Connect_Page.swift
//  Avocarbo
//
//  Created by 安塞尔 陈 on 2023-04-10.
//

import SwiftUI

struct Connect_Page: View {
    var body: some View {
        VStack{
            Spacer().frame(height:50)
            HStack{
                Spacer().frame(width:30)
                Text("CONNECT")
                    .font(.system(size:28))
                Image(systemName: "app.connected.to.app.below.fill")
                    .resizable()
                    .frame(width:50,height:50)
                Spacer().frame(width:130)
            }
            Spacer().frame(height:60)
            Group{
                HStack{
                    Text("MyFitnessPal")
                        .font(.system(size:20))
                }.frame(width:350,height:40).overlay(RoundedRectangle(cornerRadius:20)
                    .stroke(Color.black,lineWidth:1))
            }
            
            Group{
                HStack{
                    Text("Undermyfork")
                        .font(.system(size:20))
                }.frame(width:350,height:40).overlay(RoundedRectangle(cornerRadius:20)
                    .stroke(Color.black,lineWidth:1))
            }
            Spacer()
        }
    }
}

struct Connect_Page_Previews: PreviewProvider {
    static var previews: some View {
        Connect_Page()
    }
}
