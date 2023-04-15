//
//  Customize_Page.swift
//  Avocarbo
//
//  Created by 安塞尔 陈 on 2023-04-08.
//

import SwiftUI

struct Customize_Page: View {
    @State var image = UIImage()
    @State var food_name: String = ""
    @State var customize_name: String = ""
    @State var carbo: String = ""
    var body: some View {
        NavigationView{
            VStack{
                Image(uiImage: image)
                    .resizable()
                    .frame(width:200,height:200)
                Spacer().frame(height:50)
                Group{ HStack{
                    Text("Food Name")
                    Spacer().frame(width:250)
                }
                    HStack{
                        TextField("Search...", text: $food_name)
                            .multilineTextAlignment(.leading)
                            .frame(width:330,height:50).overlay(RoundedRectangle(cornerRadius:15)
                                .stroke(Color.black,lineWidth:1))
                    }
                }
                Group{Spacer().frame(height:30)
                    Text("OR")
                    Spacer().frame(height:30)}
                
                Group{ HStack{
                    Text("Customize Food Name")
                    Spacer().frame(width:160)
                }
                    HStack{
                        TextField("What is this food called?", text: $customize_name)
                            .multilineTextAlignment(.leading)
                            .frame(width:330,height:50).overlay(RoundedRectangle(cornerRadius:15)
                                .stroke(Color.black,lineWidth:1))
                    }
                }
                Group{Spacer().frame(height:30)
                    Text("_____________________________________")
                    Spacer().frame(height:30)
                }
                Group{ HStack{
                    Text("Carbohydrate Amount Per 100g")
                    Spacer().frame(width:90)
                }
                    HStack{
                        TextField("How many grams of carbohydrate is in this?", text: $carbo)
                            .multilineTextAlignment(.leading)
                            .font(.system(size:16))
                            .frame(width:330,height:50).overlay(RoundedRectangle(cornerRadius:15)
                                .stroke(Color.black,lineWidth:1))
                    }
                }
                
                HStack{
                    NavigationLink(destination: Camera_Page()){
                        Spacer().frame(width:260)
                        Text("DONE")
                            .font(.system(size:25).bold())
                            .foregroundColor(.green)
                    }
                }
                
                Spacer()
            }.navigationBarHidden(true)
        }.navigationBarHidden(true)
    }
}

struct Customize_Page_Previews: PreviewProvider {
    static var previews: some View {
        Customize_Page()
    }
}
