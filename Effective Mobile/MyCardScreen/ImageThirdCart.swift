//
//  ImageThirdCart.swift
//  Effective Mobile
//
//  Created by Алёша Виноградов on 01.09.2022.
//

import SwiftUI

struct ImageThirdCart: View {
    @State var image : UIImage = UIImage(systemName: "photo")!
    let url : String
    var body: some View {
        Image(uiImage: imageCard(url: url ))
            .resizable()
            .frame(width: UIScreen.main.bounds.height / 12 , height: UIScreen.main.bounds.height / 12 )
    }
    
    
   private func imageCard(url : String) -> UIImage {

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

struct ImageThirdCart_Previews: PreviewProvider {
    static var previews: some View {
        ImageThirdCart(url: "")
    }
}
