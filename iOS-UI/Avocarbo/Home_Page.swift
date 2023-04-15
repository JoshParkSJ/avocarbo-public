//
//  Home_Page.swift
//  Avocarbo
//
//  Created by 安塞尔 陈 on 2023-03-29.
//

import SwiftUI

struct Home_Page: View {
    var body: some View {
        VStack{

            Spacer().frame(height:70)
            Group{ HStack{
                Text("Hi, Adam!")
                    .font(.system(size:30).italic().bold())
                    .foregroundColor(.green)
                Spacer().frame(width:200)
            }
                Spacer().frame(height:10)
                Text("Your carbohydrate intake from your last meal is")
                    .font(.system(size:15).bold())
                    .foregroundColor(.gray)
                Spacer().frame(height:80)
            }
            Group{Text("42.52g")
                    .font(.system(size:40).bold().italic())
                    .foregroundColor(.green)
                Spacer().frame(height:30)
            }
            Spacer().frame(height:20)
        
            Text("___________________________________")
            Spacer().frame(height:20)
            Group{
                VStack{
                    HStack{
                        Text("Today's Meals")
                            .font(.system(size:20).bold().italic())
                        Spacer().frame(width:190)
                    }
                    Spacer().frame(height:20)
                    HStack{
                        Text("3:00 PM.")
                            .foregroundColor(.gray)
                        Spacer().frame(width:250)
                    }
                }
            }
            
            Group{
                Image("strawberry")
                    .resizable()
                    .frame(width:150,height:150)
            }.frame(width:250,height:250).overlay(Circle()
                .stroke(Color.gray,lineWidth:1))
            
            
            Spacer()
        }.navigationBarHidden(true)
        }
    }
    

struct Home_Page_Previews: PreviewProvider {
    static var previews: some View {
        Home_Page()
    }
}
