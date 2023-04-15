//
//  Recipt_Example_Page.swift
//  Avocarbo
//
//  Created by 安塞尔 陈 on 2023-04-05.
//

import SwiftUI

struct Recipt_Example_Page: View {
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: Customize_Page()){
                    HStack{
                        Spacer().frame(width:300)
                        Image(systemName:"pencil")
                            .resizable()
                            .frame(width:30,height:30)
                            .foregroundColor(.black)
                    }
                }
                Spacer().frame(height:100)
                VStack{
                    Image("strawberry")
                        .resizable()
                        .frame(width:250,height:250)
                    Spacer().frame(height:30)
                    Text("Strawberry")
                        .font(.system(size:30).bold())
                    Spacer().frame(height:100)
                    HStack{
                        Text("8g")
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


struct Recipt_Example_Page_Previews: PreviewProvider {
    static var previews: some View {
        Recipt_Example_Page()
        
    }
}
