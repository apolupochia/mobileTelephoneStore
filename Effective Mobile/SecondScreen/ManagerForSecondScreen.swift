//
//  ManagerForSecondScreen.swift
//  Effective Mobile
//
//  Created by Алёша Виноградов on 31.08.2022.
//

import Foundation
import UIKit


struct SecondScreen : Codable{
    let CPU : String?
    let camera : String?
    let capacity : [String]?
    let color : [String]?
    let id : String?
    let images : [String]?
    let isFavorites : Bool?
    let price : Double?
    let rating : Double?
    let sd : String?
    let ssd : String?
    let title : String?
}


struct CardSecond  : Identifiable{
    var id = UUID()
    var img : UIImage
    var show : Bool
}


class InfoForSecondScreen : ObservableObject{
    
    init(){
        fetchInf()
    }
    
    @Published var infoForSecondScreen : SecondScreen? = nil
    
   // static let shared = InfoForSecondScreen()
    
    
    @Published var imagesCard : [CardSecond] = []
    @Published var count : Int? = nil
    
    func fetchCard(infForSecond : SecondScreen?){

        if let checkCard = infForSecond, let cardNow = checkCard.images {
            for card in cardNow{
                imageCard(url: card )
            }
        }


    }
    
    func imageCard(url : String)  {

     //  var image : Image = Image(systemName: "person")

        guard let url = URL(string: url) else {return }


       URLSession.shared.dataTask(with: url) { (data, response, error) in
           if let error = error {
               print(error)
               return
           }

           if let response = response {
               print(response)
           }

           if let data = data, let imageUI = UIImage(data: data) {
               // let image = Image(uiImage: imageUI)
               DispatchQueue.main.async {
                   let card = CardSecond( img: imageUI, show: false)
                   self.imagesCard.append(card)
                   
               }
           }

       }.resume()
       
    

   }
    
    
    
    

    
    func fetchInf() {
        
        let URLL = "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5"
        
        guard let url = URL(string: URLL) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            print("TYT 1")
            if let error = error  {
                print("ERROR \(error.localizedDescription)" )
                return
            }
            print("TYT 2")
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Status : \(httpResponse.statusCode)")
            }
            guard let data = data else {
                return
            }
            
            do{
                let forSecondScreen = try? JSONDecoder().decode(SecondScreen.self, from: data)
                
                DispatchQueue.main.async {
                    self.infoForSecondScreen = forSecondScreen
                    self.fetchCard(infForSecond: forSecondScreen)
//
                    
                }
                
//                print(self.infoForSecondScreen?.CPU)
//                print("\n\nTYT\n\n")
//                print(self.infoForSecondScreen?.title)
//                print(self.infoForSecondScreen?.color)
          //      return self.infoForSecondScreen?.
               
            } catch let error{
                print(error)
            }
           



        }.resume()
    }
    
}



class FoodUrlImageSecond : ObservableObject {

    @Published var downloadImage : UIImage?
    
//    var url : String
//
//    init(url : String){
//        self.url = url
//        imageCard(url: url)
//    }
    
    
    
    private func imageCard(url : String)  {

      //  var image : Image = Image(systemName: "person")

        guard let url = URL(string: url) else {return }


        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }

            if let response = response {
                print(response)
            }

            if let data = data, let imageUI = UIImage(data: data) {
                // let image = Image(uiImage: imageUI)
                DispatchQueue.main.async {
                    self.downloadImage = imageUI
                }
            }

        }.resume()

    }
    
    
}

