//
//  Food_info_2_Page.swift
//  Avocarbo
//
//  Created by 安塞尔 陈 on 2023-04-10.
//

import SwiftUI

struct Food_info_2_Page: View {
    var body: some View {
        NavigationView{
            VStack{
                Spacer().frame(height:100)
                VStack{
                    Image("cauliflower")
                        .resizable()
                        .frame(width:250,height:250)
                    Spacer().frame(height:30)
                    Text("Cauliflower")
                        .font(.system(size:30).bold())
                    Spacer().frame(height:100)
                    HStack{
                        Text("5g")
                            .font(.system(size:40).bold())
                            .foregroundColor(.green)
                        Text("of carbohydrate")
                            .font(.system(size:30))
                    }.multilineTextAlignment(.center)
                    Text("per 100g")
                        .font(.system(size:30))
                }
                Spacer()
            }
               
            }
    }
}

struct Food_info_2_Page_Previews: PreviewProvider {
    static var previews: some View {
        Food_info_2_Page()
    }
}
