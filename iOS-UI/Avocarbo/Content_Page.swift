//
//  Content_Page.swift
//  Avocarbo
//
//  Created by 安塞尔 陈 on 2023-03-29.
//

import SwiftUI
import Foundation


struct Content_Page: View {
    var body: some View {
            TabView{
                Home_Page()
                    .tabItem(){
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                Recipt_Page()
                    .tabItem(){
                        Image(systemName: "book.fill")
                        Text("Recipe")
                    }
                Camera_Page()
                    .tabItem(){
                        Image(systemName: "camera.fill")
                        Text("Camera")
                    }
                History_Page(historyEntries: getHistory())
                    .tabItem(){
                        Image(systemName: "clock.fill")
                        Text("History")
                    }
                Profile_Page()
                    .tabItem(){
                        Image(systemName: "person.crop.circle.fill")
                        Text("Profile")
                    }
            }.navigationBarHidden(true)
            
        
    }
}

func getHistory() -> HistoryEntryModels{
    
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

struct Content_Page_Previews: PreviewProvider {
    static var previews: some View {
        Content_Page()
    }
}
