//
//  Policy_Page.swift
//  Avocarbo
//
//  Created by 安塞尔 陈 on 2023-03-29.
//

import SwiftUI

struct Policy_Page: View {
    var body: some View {
        NavigationView{
            VStack{
                Link(destination: URL(string: "https://www.termsfeed.com/live/e41b1e1b-5e84-4412-96b6-34d7b32e79ae")!) {
                    Image(systemName: "link.circle.fill")
                        .font(.largeTitle)
                }
                
                NavigationLink(destination: Content_Page()){
                    Text("AGREE")
                        .frame(width:350,height:40)
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(10)
                        .bold()
                }
                
            }
        }.navigationBarHidden(true)
        
    }
}

struct Policy_Page_Previews: PreviewProvider {
    static var previews: some View {
        Policy_Page()
    }
}


