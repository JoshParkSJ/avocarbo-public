//
//  Summary_Page.swift
//  Avocarbo
//
//  Created by 安塞尔 陈 on 2023-04-06.
//
import Foundation
import SwiftUI

struct Summary_Page: View {
    var carb: CarbResponseModel
    var image = UIImage()
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                Group{
                    Image(uiImage: image)
                        .resizable()
                        .frame(width:150,height:150)
                }.frame(width:350,height:250).overlay(Circle()
                    .stroke(Color.black,lineWidth:1))
                Text("April 11th, 2023 2:30PM")
                    .foregroundColor(.gray)
                Spacer().frame(height:100)
                
                Group{Text("Your meal has a total of")
                        .font(.system(size:20))
                    Spacer().frame(height:20)
                    Text(carb.carbCount)
                        .foregroundColor(.green)
                        .bold()
                        .italic()
                        .font(.system(size:40))
                    Spacer().frame(height:20)
                    Text("of carbohydrates")
                        .font(.system(size:20))
                    Spacer().frame(height:100)
                    NavigationLink(destination: Camera_Page()){
                        Text("DONE")
                            .font(.system(size:25))
                            .foregroundColor(.green)
                            .bold()
                    }
                }
                
                Spacer()
            }
        }.navigationBarHidden(true)
            
            
    }
}

struct Summary_Page_Previews: PreviewProvider {
    static var previews: some View {
        Summary_Page(carb: CarbResponseModel(id: "kek", type: "Strawberry", confidence: "100", carbCount: "100", volume: "100"))
    }
}
