//
//  imggg.swift
//  Effective Mobile
//
//  Created by Алёша Виноградов on 13.09.2022.
//

import SwiftUI

struct imggg: View {
    
    @State var image : UIImage = UIImage(systemName: "photo")!
    var card : home_store
    
//    let cls = asdd()
    
    
    var body: some View {
        Image(uiImage:  imageCard(url: card.picture!))
     //   Image(uiImage:  cls.qw(str: card.picture ?? ""))
   // Image(uiImage:  UIImage(systemName: "photo")!)
        .resizable()
        .frame(width: UIScreen.main.bounds.width / 1.2 , height: UIScreen.main.bounds.height / 4.5)
        .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
        
        
    }
    
    
    

    func imageCard(url : String) -> UIImage {

     //  var image : Image = Image(systemName: "person")

       guard let url = URL(string: url) else {return image}


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
                   self.image = imageUI
               }
           }

       }.resume()

       return image

   }
}

struct imggg_Previews: PreviewProvider {
    static var previews: some View {
        imggg(card: home_store())
    }
}




class asdd{
    
    @State var image : UIImage = UIImage(systemName: "photo")!
    
    static var shared = asdd()
    
    func qw(str : String) -> UIImage{
        imageCard(url: str)
        return image
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
                   self.image = imageUI
               }
           }

       }.resume()
       
    

   }
}
