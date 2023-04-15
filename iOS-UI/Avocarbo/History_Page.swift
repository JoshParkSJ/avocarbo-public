//
//  History_Page.swift
//  Avocarbo
//
//  Created by 安塞尔 陈 on 2023-03-29.
//

import SwiftUI

struct History_Page: View {
    @State var historyEntries: HistoryEntryModels
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer().frame(height:50)
                HStack{
                    Text("HISTORY")
                        .bold()
                        .font(.system(size:25))
                        .foregroundColor(.green)
                    Image(systemName: "clock")
                        .resizable()
                        .frame(width:25,height:25)
                    Spacer().frame(width:70)
                    Button(action: {
                        historyEntries = getRecentHistory()
//                        HistoryEntryModels(history: [HistoryEntryModel(id: "hello", food: "Put", carbAmount: "45", image: UIImage(named: "bread")!.jpegData(compressionQuality: 1)?.base64EncodedString() ?? "")])
                        
                    }){
                        Text("Refresh").padding()
                    }
                    //ButtonReloadResults(historyEntries: historyEntries)
                    
                }
                Text("_____________________________________")
                Spacer().frame(height:20)
                Group{
                    VStack{
                        HStack{Text("April 11th")
                                .font(.system(size:20))
                            Spacer().frame(width:250)
                        }
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack{
                                ForEach(historyEntries.history ?? []){ entry in
                                    
                                    Group{
                                        NavigationLink(destination: Food_info_Page(historyEntry: entry)){

                                            //print(entry.image)
                                            entry.image != "" ?
                                            Image(uiImage: UIImage(data: Data(base64Encoded: entry.image ?? "")!)!).resizable()
                                                .frame(width:150,height:150)
                                            :
                                            Image(uiImage: UIImage(named: "chicken")!).resizable()
                                                .frame(width:150,height:150)
                                            
//                                            Image(uiImage: UIImage(data: Data(base64Encoded: entry.image ?? "")!)!)
//                                                .resizable()
//                                                .frame(width:150,height:150)
                                        }
                                        
                                        
                                    }
                                }
                                
                                
//                                NavigationLink(destination: Food_info_2_Page()){
//                                    Image("cauliflower")
//                                        .resizable()
//                                        .frame(width:150,height:150)
//
//                                }
//                                NavigationLink(destination: Food_info_2_Page()){
//                                    Image("cauliflower")
//                                        .resizable()
//                                        .frame(width:150,height:150)
//
//                                }
//                                NavigationLink(destination: Food_info_2_Page()){
//                                    Image("cauliflower")
//                                        .resizable()
//                                        .frame(width:150,height:150)
//
//                                }
                                
                            }
                        }
//                        VStack{
//                            VStack{
//                                NavigationLink(destination: Food_info_Page()){
//                                    Image(uiImage: UIImage(data: Data(base64Encoded: historyEntries.history?[0].image ?? "")!)!)
//                                        .resizable()
//                                        .frame(width:150,height:150)
//
//                                }
//
//                                NavigationLink(destination: Food_info_2_Page()){
//                                    Image("cauliflower")
//                                        .resizable()
//                                        .frame(width:150,height:150)
//
//                                }
//
//
//
//                            }
//
//
//                        }
                        Spacer().frame(height:20)
                        
                    }
                }
                
                Text("_____________________________________")
                Spacer().frame(height:20)
                Spacer()
            }
        }
    }
    
    
    
}

func getRecentHistory() -> HistoryEntryModels{
    
    print("got history")
    let url = URL(string: "cloud_url/history")!
    let request = NSMutableURLRequest(url: url as URL)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    var tempRespo = HistoryEntryModels(history: [HistoryEntryModel(id: "hello", food: "Put", carbAmount: "45", image: "hihi")])
    
    let semaphore: DispatchSemaphore = DispatchSemaphore(value: 0)
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let data = data {
            //print(String(data: data, encoding: .utf8)!)
            
            if let responseObject = try? JSONDecoder().decode(HistoryEntryModels.self, from: data) {
                print(responseObject.history?[0].id)
                tempRespo = responseObject
            } else {
                print("Invalid Response")
            }
        } else if let error = error {
            print("HTTP Request Failed \(error)")
        }
         
        semaphore.signal()
    }
    task.resume()
    semaphore.wait()
    print(tempRespo.history?[0].id)
    return tempRespo
}

struct ButtonReloadResults: View {
    var historyEntries: HistoryEntryModels
    
    var body: some View {
           VStack {
//               Button(action: {
//                   historyEntries = HistoryEntryModels(history: [HistoryEntryModel(id: "hello", food: "Put", carbAmount: "45", image: "hihi")])
//
//               }){
//                   Text("Button").padding()
//               }
            }
    }
}




struct HistoryEntryModels: Codable {
    var history: [HistoryEntryModel]?
}

struct HistoryEntryModel: Codable, Identifiable {
    var id: String
    var food: String
    var carbAmount: String
    var image: String
}

struct History_Page_Previews: PreviewProvider {
    static var previews: some View {
        History_Page(historyEntries: HistoryEntryModels(history: [HistoryEntryModel(id: "hello", food: "Put", carbAmount: "45", image: "hihi")]) )
    }
}
