//
//  SecondScreenCardOne.swift
//  Effective Mobile
//
//  Created by Алёша Виноградов on 29.08.2022.
//

import SwiftUI

struct SecondScreenCardOne: View {
    @State var image : UIImage = UIImage(systemName: "photo")!
    var card : Card
    
    var body: some View {
        VStack( spacing: 0){
           

        //     Image(uiImage:  imageCard(url: card.img))
            Image(uiImage:  UIImage(systemName: "photo")!)
                .resizable()
                .frame(width: UIScreen.main.bounds.width - 30 , height: card.show ? 460 : 400)
                .offset(x: 100)
               // .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
        }
      //  .cornerRadius(25)
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

struct SecondScreenCardOne_Previews: PreviewProvider {
    static var previews: some View {
        SecondScreenCardOne(  card: Card( img: Image("imageNotFound"), show: false))
    }
}
