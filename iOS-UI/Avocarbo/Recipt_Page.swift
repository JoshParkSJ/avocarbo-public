//
//  Recipt_Page.swift
//  Avocarbo
//
//  Created by 安塞尔 陈 on 2023-03-29.
//

import SwiftUI

struct Recipt_Page: View {
    var body: some View {
        NavigationView{
        VStack{
            Spacer().frame(height:50)
            HStack{
                Text("RECIPES")
                    .bold()
                    .font(.system(size:25))
                    .foregroundColor(.green)
            }
            Text("_____________________________________")
            Spacer().frame(height:30)
            NavigationLink(destination: Recipt_Example_Page()){
                HStack{
                    Image("strawberry")
                        .resizable()
                        .frame(width:100,height:100)
                    Spacer().frame(width:70)
                    VStack{
                        Text("Strawberry")
                            .bold()
                            .foregroundColor(.black)
                        Text("8g carbs/100g")
                            .foregroundColor(.gray)
                            .italic()
                    }
                }
            }.frame(width:330,height:110).overlay(RoundedRectangle(cornerRadius:20)
                .stroke(Color.black,lineWidth:1))
                
        Spacer()
        }.navigationBarHidden(true)
        }.navigationBarHidden(true)
        }
        
        
        //.background(Image("background")
         //   .resizable()
         //   .opacity(0.5)
         //   .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
         //   .edgesIgnoringSafeArea(.all))

    
        }

struct Recipt_Page_Previews: PreviewProvider {
    static var previews: some View {
        Recipt_Page()
    }
}
