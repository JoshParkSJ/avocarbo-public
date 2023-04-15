//
//  ContentView.swift
//  Avocarbo
//
//  Created by 安塞尔 陈 on 2023-03-28.
//

import SwiftUI

//struct Result_Page: View {
//    var body: some View {
//        NavigationView{
//            VStack {
//                Group{
//                    Image("strawberry")
//                        .resizable()
//                        .frame(width:150,height:150)
//                    Text("Choose your food!")
//                        .font(.system(size:25).bold().italic())
//                    Text("Here are our top 5 guesses and estimated carbohydrate amounts.")
//                        .foregroundColor(.gray)
//                        .multilineTextAlignment(.center)
//                }
//                Spacer().frame(height:20)
//                VStack{
//                    Group{
//                        HStack{
//                            Text("Food Name")
//                                .foregroundColor(.gray)
//                                .font(.system(size:20))
//                            Spacer().frame(width:100)
//                            Text("Net Carbs (g)")
//                                .font(.system(size:20))
//                                .foregroundColor(.gray)
//                        }
//                    }
//
//                    Group{
//                        NavigationLink(destination: Confirm_Page()){
//                            HStack{
//                                Text("Strawberry")
//                                    .font(.system(size:20))
//                                    .bold()
//                                Spacer().frame(width:165)
//                                Text("32.52")
//                                    .font(.system(size:20))
//                                    .bold()
//
//                            }.frame(width:350,height:40).overlay(RoundedRectangle(cornerRadius:20)
//                                .stroke(Color.black,lineWidth:1))
//                        }.foregroundColor(.black)
//                    }
//                    Spacer().frame(height:20)
//                    Group{
//                        HStack{
//                            Text("Pomegranate")
//                                .font(.system(size:20))
//
//                            Spacer().frame(width:150)
//                            Text("51.30")
//                                .font(.system(size:20))
//
//                        }.frame(width:350,height:40).overlay(RoundedRectangle(cornerRadius:20)
//                            .stroke(Color.black,lineWidth:1))
//                    }
//                    Spacer().frame(height:20)
//                    Group{
//                        HStack{
//                            Text("Fig")
//                                .font(.system(size:20))
//
//                            Spacer().frame(width:230)
//                            Text("86.25")
//                                .font(.system(size:20))
//
//
//                        }.frame(width:350,height:40).overlay(RoundedRectangle(cornerRadius:20)
//                            .stroke(Color.black,lineWidth:1))
//                    }
//                    Spacer().frame(height:20)
//                    VStack{
//                        Group{
//                            HStack{
//                                Text("Hip")
//                                    .font(.system(size:20))
//
//                                Spacer().frame(width:265)
//                                Text("0")
//                                    .font(.system(size:20))
//
//
//                            }.frame(width:350,height:40).overlay(RoundedRectangle(cornerRadius:20)
//                                .stroke(Color.black,lineWidth:1))
//                        }
//                        Spacer().frame(height:20)
//                        Group{
//                            HStack{
//                                Text("Banana")
//                                    .font(.system(size:20))
//
//                                Spacer().frame(width:200)
//                                Text("127.50")
//                                    .font(.system(size:20))
//
//                            }.frame(width:350,height:40).overlay(RoundedRectangle(cornerRadius:20)
//                                .stroke(Color.black,lineWidth:1))
//                        }
//
//                        Spacer().frame(height:20)
//                        Group{
//                            NavigationLink(destination: Customize_Page()){
//                                HStack{
//                                    Text("Don't see your food?")
//                                        .font(.system(size:20))
//                                        .bold()
//                                    Spacer().frame(width:110)
//                                    Text("Coustomize your meal...")
//                                        .font(.system(size:20).italic())
//                                        .foregroundColor(.gray)
//                                        .bold()
//
//                                }.frame(width:350).overlay(RoundedRectangle(cornerRadius:20)
//                                    .stroke(Color.black,lineWidth:1))
//                            }
//                        }
//                    }
//                }
//            }
//
//        }.navigationBarHidden(true)
//    }
//}


struct Result_Page : View {

    var carbs: CarbResponseModels
    var image = UIImage()

    var body: some View {
        VStack{
            Group{
                Image(uiImage: image)
                    .resizable()
                    .frame(width:150,height:150)
                Text("Choose your food!")
                    .font(.system(size:25).bold().italic())
                Text("Here are our top 5 guesses and estimated carbohydrate amounts.")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }
            Spacer().frame(height:20)
            
            Group{
                HStack{
                    Text("Food Name")
                        .foregroundColor(.gray)
                        .font(.system(size:20))
                    Spacer().frame(width:100)
                    Text("Net Carbs (g)")
                        .font(.system(size:20))
                        .foregroundColor(.gray)
                }
            }
            Spacer().frame(height:20)
                
            ForEach(carbs.foods ?? []){ carb in
                
                Group{
                    NavigationLink(destination: Summary_Page(carb:carb, image:image)){
                        HStack{
                            Text(carb.type)
                                .font(.system(size:20))
                                .bold()
                            Spacer().frame(width:165)
                            Text(carb.carbCount)
                                .font(.system(size:20))
                                .bold()

                        }.frame(width:350,height:40).overlay(RoundedRectangle(cornerRadius:20)
                            .stroke(Color.black,lineWidth:1))
                    }.foregroundColor(.black)
                }
                Spacer().frame(height:20)
                
            }
            //endofForeach
            
            //Spacer().frame(height:20)
            
            Group{
                NavigationLink(destination: Customize_Page(image: image )){
                    HStack{
                        Text("Don't see your food?")
                            .font(.system(size:20))
                            .bold()
                        Spacer().frame(width:110)
                        Text("Customize your meal...")
                            .font(.system(size:20).italic())
                            .foregroundColor(.gray)
                            .bold()

                    }.frame(width:350).overlay(RoundedRectangle(cornerRadius:20)
                        .stroke(Color.black,lineWidth:1))
                }
            }
            
        }
    }
}

struct Result_Page_Previews: PreviewProvider {
    static var previews: some View {
        Result_Page(carbs: CarbResponseModels(foods: [CarbResponseModel(id: "kek", type: "Strawberry", confidence: "100", carbCount: "100", volume: "100"), CarbResponseModel(id: "kak", type: "Banana", confidence: "100", carbCount: "80", volume: "100")]))
    }
}

