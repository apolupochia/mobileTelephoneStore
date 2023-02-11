//
//  FirstScreenCard.swift
//  Effective Mobile
//
//  Created by Алёша Виноградов on 23.08.2022.
//

import SwiftUI

struct FirstScreenCard: View {
  //   var id : Int
     var title : String?
  //   var subtitle : String
     var imageURL : String?
    @State var image : UIImage = UIImage(systemName: "photo")!
    
    @ObservedObject  var urlImage = FoodUrlImage()
    
    var body: some View {
        HStack{
            VStack{
               // Text("id : \(id)")
               // Text("is_new : \(is_new)")
                Text("title : \(title ?? "12") ")
               // Text("subtitle : \(subtitle)")
            }
            
            if let imageURL =  imageURL {
                Image(uiImage: imageCard(url: imageURL))
                    .resizable()
                    .frame(width: 50, height: 50)
                    .mask(Circle())
            }
            }

    }
    
    private func imageCard(url : String) -> UIImage  {

      //  var image : Image = Image(systemName: "person")

        guard let url = URL(string: url) else {return UIImage(systemName: "pen")! }


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

struct FirstScreenCard_Previews: PreviewProvider {
    static var previews: some View {
      //  FirstScreenCard(id: 1,  title: "1", subtitle: "1", imageURL: "")
        FirstScreenCard(title: "1", imageURL: "1")
    }
}
