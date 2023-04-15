//
//  Camera_Page.swift
//  Avocarbo
//
//  Created by 安塞尔 陈 on 2023-03-29.
//

import SwiftUI
import Foundation


struct Camera_Page: View {
    @State private var isShowPhotoLibrary = false
    var isButtonHidden = true
    @State private var image = UIImage()
    @State private var carbResponse:CarbResponseModels = CarbResponseModels(foods: [CarbResponseModel(id: "kek", type: "default", confidence: "100", carbCount: "100", volume: "100")])
    
    var body: some View {
        
        NavigationView{
            VStack{
                Spacer()
                
                
                Image(uiImage: self.image)
                                .resizable()
                                .scaledToFill()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .edgesIgnoringSafeArea(.all)
                 
                Button(action: {
                    self.isShowPhotoLibrary = true
                }) {
                    HStack {
                        Image(systemName: "camera")
                            .font(.system(size: 20))
     
                        Text("Capture Meal")
                            .font(.headline)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.horizontal)
                    ButtonConfirmResults(carbData: carbResponse, image: image)
                }
                
                
//                ButtonTestView()
//                NavigationLink(destination: Result_Page(carbs: carbResponse)){
//                    Text("Result Page")
//                        .frame(width:150,height:35)
//                        .background(Color.green)
//                        .cornerRadius(100)
//                        .bold()
//
//                }
            }
            
            .sheet(isPresented: $isShowPhotoLibrary) {
                ImagePicker(selectedImage: self.$image, carbResponse: self.$carbResponse, sourceType: .camera)
                
            }
                    
            
        }.navigationBarHidden(true)
            
    }
}

struct CarbRequestModel: Codable {
    var file: String
}

struct CarbResponseModels: Codable {
    var foods: [CarbResponseModel]?
}

struct CarbResponseModel: Codable, Identifiable {
    var id: String
    var type: String
    var confidence: String
    var carbCount: String
    var volume: String
}

struct ButtonView: View {
    var isButtonHidden = false
    var body: some View {
        Text("Confirm")
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(20)
            .padding(.horizontal)
            .opacity(isButtonHidden ? 0 : 1)
    }
}
    
//Confirms Photo and takes you to Results
struct ButtonConfirmResults: View {
    var carbData: CarbResponseModels
    var image: UIImage
    
    var body: some View {
           VStack {
               NavigationLink(destination: Result_Page(carbs: carbData, image: image )) {
                   ButtonView()
               }
            }
    }
}

struct ButtonTestView: View
{
    var body: some View
    {
        Button(action: {            
            let image : UIImage = UIImage(named: "chicken")!
            let imageData = image.jpegData(compressionQuality: 1)
            let imageBase64String = imageData?.base64EncodedString()
            
            //print(imageBase64String)
            //let imageData: NSData = UIImagePNGRepresentation(file)!
            
            let url = NSURL(string: "cloud_url/calculate_carbs")!
            
            let body = CarbRequestModel(file: imageBase64String!)
            
            let request = NSMutableURLRequest(url: url as URL)
            
            do {
                let jsonData = try JSONEncoder().encode(body)
                request.httpBody = jsonData
                
                request.httpMethod = "POST"
                request.allHTTPHeaderFields = [
                    "Content-Type": "application/json"
                ]
                
                let session = URLSession.shared
                let task = session.dataTask(with: request as URLRequest) {
                    data, response, error in
                    if let response = response, let data = data{
                        
                        let dataString = String(data:data, encoding: .utf8)
                        print(dataString)
                        
                        
                        do {
                            let decoder = JSONDecoder()
                            let responseObject = try decoder.decode(CarbResponseModels.self, from: data)
                            
                            print(responseObject.foods)
                        } catch {
                            print("Could not parse response:(")
                            
                        }
                        
                    } else {
                        print(error!)
                    }
                }
                task.resume()
            } catch{
                print("Ohhn noo")
            }
            
        }){
            Text("Button").padding()
        }
    }
}

struct Camera_Page_Previews: PreviewProvider {
    static var previews: some View {
        Camera_Page()
    }
}


struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage
    @Binding var carbResponse: CarbResponseModels
    @Environment(\.presentationMode) private var presentationMode
 
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
 
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        
        
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
 
        return imagePicker
    }
 
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
 
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
     
        var parent: ImagePicker
     
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
     
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
     
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                print("image taken!! JEJE")
                
                parent.selectedImage = image
                
                
                
                //let image : UIImage = UIImage(named: "chicken")!
                let imageData = image.jpegData(compressionQuality: 0)
                let imageBase64String = imageData?.base64EncodedString()
                
                let url = NSURL(string: "cloud_url/calculate_carbs")!
                
                let body = CarbRequestModel(file: imageBase64String!)
                
                let request = NSMutableURLRequest(url: url as URL)
                
                do {
                    let jsonData = try JSONEncoder().encode(body)
                    request.httpBody = jsonData
                    
                    request.httpMethod = "POST"
                    request.allHTTPHeaderFields = [
                        "Content-Type": "application/json"
                    ]
                    
                    let session = URLSession.shared
                    let task = session.dataTask(with: request as URLRequest) {
                        data, response, error in
                        if let response = response, let data = data{
                            
                            let dataString = String(data:data, encoding: .utf8)
                            print(dataString)
                            
                            
                            do {
                                let decoder = JSONDecoder()
                                let responseObject = try decoder.decode(CarbResponseModels.self, from: data)
                                
                                self.parent.carbResponse = responseObject
                                
                                print(responseObject.foods)
                            } catch {
                                print("Could not parse response:(")
                                
                            }
                            
                        } else {
                            print(error!)
                        }
                    }
                    task.resume()
                } catch{
                    print("Ohhn noo")
                }
            }
     
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        
    }
}
