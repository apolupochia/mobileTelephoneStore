//
//  ManagerForThirdScreen.swift
//  Effective Mobile
//
//  Created by Алёша Виноградов on 01.09.2022.
//


import Foundation
import UIKit
import SwiftUI


struct ThirdScreen : Codable{
    var basket : [basket]
    let delivery : String?
    let id : String?
    let total : Int
}

struct basket : Codable, Identifiable{
    let id : Int?
    let images : String?
    let price : Int?
    let title : String?
}


//struct CardSecond  : Identifiable{
//    var id = UUID()
//    var img : UIImage
//    var show : Bool
//}


class InfoForThirdScreen : ObservableObject{
    
    init(){
        fetchInf()
    }
    @Published var summPrice : Int?
    
    @Published var infoForThirdScreen : ThirdScreen? = nil
    
    @Published var images : [Card] = []
    
  //  static let shared = InfoForThirdScreen()
    
    
//    @Published var imagesCard : [CardSecond] = []
//    @Published var count : Int? = nil
    
    func fetchImages(infForThird : ThirdScreen?)  {
        if let checkCard = infForThird {
            for card in checkCard.basket{
                imageCard(url: card.images ?? "")
                
            }
        }
    }
    
    
    func fetchPrice(infForThird : ThirdScreen?){

        if let checkCard = infForThird {
            var sum = 0
            for card in checkCard.basket{
                sum += card.price ?? 0
            }
            summPrice = sum
            
            
            
        }


    }
//    
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
                   let card = Card( img: Image(uiImage: imageUI), show: false)
                   self.images.append(card)
                   
               }
           }

       }.resume()
   }
    
    
    
    

    
    func fetchInf() {
        
        let URLL = "https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149"
        
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
                let forSecondScreen = try? JSONDecoder().decode(ThirdScreen.self, from: data)
                
                DispatchQueue.main.async {
                    self.infoForThirdScreen = forSecondScreen
                    self.fetchPrice(infForThird: forSecondScreen)
                    self.fetchImages(infForThird: forSecondScreen)
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

