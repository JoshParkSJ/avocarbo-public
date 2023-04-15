//
//  Confirm_Page.swift
//  Avocarbo
//
//  Created by 安塞尔 陈 on 2023-04-05.
//

//import SwiftUI
//
//struct Confirm_Page: View {
//    var body: some View {
//        NavigationView{
//            VStack{
//                Spacer().frame(height:50)
//                HStack{
//                    VStack{
//                        HStack{
//                            Spacer().frame(width:120)
//                            Image(systemName: "minus.circle")
//                                .resizable()
//                                .frame(width:25,height:25)
//                        }
//                        Image("strawberry")
//                            .resizable()
//                            .frame(width:130,height:130)
//                        Text("Strawberry")
//                            .bold()
//                        Text("32.52g")
//                            .foregroundColor(.gray)
//                            .italic()
//                    }.frame(width:160,height:230).overlay(RoundedRectangle(cornerRadius:20)
//                        .stroke(Color.black,lineWidth:1))
//                    Spacer().frame(width:30)
//
//                    VStack{
//                        Image(systemName: "plus.circle")
//                            .resizable()
//                            .frame(width:50,height:50)
//                        Text("Add More...")
//                            .foregroundColor(.gray)
//                            .italic()
//                    }.frame(width:160,height:230).overlay(RoundedRectangle(cornerRadius:20)
//                        .stroke(Color.black,lineWidth:1))
//                }
//
//                Spacer().frame(height:100)
//
//
//                HStack{
//                    NavigationLink(destination: Summary_Page(carb: CarbRequestModel(id: "kek", type: "Strawberry", confidence: "100", carbCount: "100", volume: "100")){
//                        Text("Confirm")
//                            .font(.system(size:25).bold())
//                            .foregroundColor(.green)
//
//                    }.foregroundColor(.black)
//                        .frame(width:100,height:50)
//                    Image(systemName: "checkmark")
//                }.navigationBarHidden(true)
//
//                Spacer().frame(height:350)
//            }.navigationBarHidden(true)
//        }.navigationBarHidden(true)
//    }
//}
//
//struct Confirm_Page_Previews: PreviewProvider {
//    static var previews: some View {
//        Confirm_Page()
//    }
//}
