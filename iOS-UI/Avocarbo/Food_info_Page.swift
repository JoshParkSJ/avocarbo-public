//
//  Food_info_Page.swift
//  Avocarbo
//
//  Created by 安塞尔 陈 on 2023-04-08.
//

import SwiftUI

struct Food_info_Page: View {
    
    var historyEntry: HistoryEntryModel
    
    var body: some View {
            NavigationView{
                VStack{
                    Spacer().frame(height:100)
                    VStack{
                        Image(uiImage: UIImage(data: Data(base64Encoded: historyEntry.image ?? "")!)!)
                            .resizable()
                            .frame(width:250,height:250)
                        Spacer().frame(height:30)
                        Text(historyEntry.food)
                            .font(.system(size:30).bold())
                        Spacer().frame(height:100)
                        HStack{
                            Text(historyEntry.carbAmount)
                                .font(.system(size:40).bold())
                                .foregroundColor(.green)
                            Text("of carbohydrate")
                                .font(.system(size:30))
                        }.multilineTextAlignment(.center)

                    }
                    Spacer()
                }
                   
                }
            }
    }


struct Food_info_Page_Previews: PreviewProvider {
    static var previews: some View {
        Food_info_Page(historyEntry: HistoryEntryModel(id: "hello", food: "Put", carbAmount: "45", image: "hihi"))
    }
}
