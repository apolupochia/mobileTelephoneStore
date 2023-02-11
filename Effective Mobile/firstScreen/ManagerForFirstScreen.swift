//
//  ManagerForFirstScreen.swift
//  Effective Mobile
//
//  Created by Алёша Виноградов on 23.08.2022.
//

import Foundation
import UIKit
import SwiftUI

struct Card  : Identifiable{
    var id = UUID()
    var img : Image
    var show : Bool
}


class InfoForFistScreen : ObservableObject{
    
    init(){
        fetchInf()
    }
    
    @Published var infForFirstScreen : firstScreen? = nil
    
 //   static let shared = InfoForFistScreen()
    
    
    @Published var imagesForBestSeller : [Card] = []
    @Published var imagesForHomeStore : [Card] = []
    
    @Published var count : Int? = nil
    
    
    @Published var titles : [String] = []
    @Published var prices : [String] = []
    @Published var sizes  : [String] = ["4.5 to 5.5 inches"]
    
    func fetchImages(infForFirst : firstScreen?){
        
        if let checkCard = infForFirst, let cardNow = checkCard.best_seller {
            for card in cardNow{
                imageCardForbestSeller(url: card.picture ?? "")
            }
        }
        
        if let checkCard = infForFirst, let cardNow = checkCard.home_store {
            for card in cardNow{
                imageCardForHomeStore(url: card.picture ?? "")
            }
        }
    }
    
    
    
    func fetchInfoForBottomMenu(infForFirst : firstScreen?){
        if let checkCard = infForFirst, let cardNow = checkCard.best_seller {
            for card in cardNow{
                titles.append(card.title ?? "")
                let price = "$" + String(card.price_without_discount!) + " - " +  "$" + String(card.discount_price!)
                prices.append(price)
                
            }
        }
        
    }
    
    func imageCardForbestSeller(url : String)  {

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
                   self.imagesForBestSeller.append(card)
                   
               }
           } else {
               
             
               let card = Card( img: Image("imageNotFound"), show: false)
               self.imagesForBestSeller.append(card)
               
           }

       }.resume()
   }
    
    func imageCardForHomeStore(url : String)  {

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
                   self.imagesForHomeStore.append(card)
                   
               }
           } else {
               let card = Card( img: Image("imageNotFound"), show: false)
               self.imagesForHomeStore.append(card)
               
           }

       }.resume()
   }
    
    
    
    

    
    func fetchInf() {
        
        let URLL = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"
        
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
                let ForFirstScreen = try? JSONDecoder().decode(firstScreen.self, from: data)
                
                DispatchQueue.main.async {
                    self.infForFirstScreen = ForFirstScreen
                    self.fetchImages(infForFirst: ForFirstScreen)
                    self.count = ForFirstScreen?.best_seller?.count
                    self.fetchInfoForBottomMenu(infForFirst: ForFirstScreen)
                    
                }
                
//                print(self.infForFirstScreen?.home_store)
//                print("\n\nTYT\n\n")
//                print(self.infForFirstScreen?.best_seller?.count)
//                print(self.infForFirstScreen?.best_seller)
               // return infForFirstScreen
               
            } catch let error{
                print(error)
            }
           



        }.resume()
    }
    
}



class FoodUrlImage : ObservableObject {

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
