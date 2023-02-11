//
//  SelectCategoryFirstVerticalCard.swift
//  Effective Mobile
//
//  Created by Алёша Виноградов on 28.08.2022.
//

import SwiftUI

struct SelectCategoryFirstVerticalCard: View {
    @State var colorHeart = true
    @State var image : UIImage = UIImage(systemName: "photo")!
 //   var stringUrlImage : String
    var card : best_seller
    
    @Binding var selectedTab : Tab
    
    
    var img : Image
    var body: some View {
      //  Image(uiImage:  imageCard(url: stringUrlImage))
        
        Button {
            selectedTab = Tab.house
        } label: {
            ZStack{
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width * 45 / 100 , height: UIScreen.main.bounds.height / 3 )
                    .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .foregroundColor(.white)
               // Image(uiImage:  imageCard(url: card.picture ?? ""))
                img
     
                //Image(uiImage:  UIImage(systemName: "photo")!)
                .resizable()
                .frame(width: UIScreen.main.bounds.width * 40 / 100 , height: UIScreen.main.bounds.height / 4 )
                .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .offset( y : CGFloat(-25) )
                ZStack{
                    Button {
                        colorHeart.toggle()
                    } label: {
                        ZStack{
                            Circle()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                            
                            
                            Image(systemName: "suit.heart.fill")
                                .frame(width: 20, height: 20)
                                .foregroundColor(card.is_favorites! == true && colorHeart == true ? .red : .white)
                        }
                    }

          
                        
                        
                }
                .shadow(color: .gray, radius: 1, x: 0, y: 0)
                
                .frame(maxWidth:  UIScreen.main.bounds.width * 45 / 100 , alignment: .trailing)
                .frame( maxHeight: UIScreen.main.bounds.height / 3, alignment: .top)
                .offset(x: CGFloat(-5), y : CGFloat( 5) )
                HStack{
                    Text("$ \(card.price_without_discount ?? 0)")
                        .font(Font.custom("MarkPro-Heavy", size: 20))
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                       // .frame(maxWidth:  UIScreen.main.bounds.width * 45 / 100 , alignment: .leading)
                      //  .offset(x: CGFloat(15), y : CGFloat( 100) )
                    ZStack{
                        Text("$ \(card.discount_price ?? 0)")
                            .font(Font.custom("MarkPro", size: 15))
                            .foregroundColor(.gray)
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width / 9, height: UIScreen.main.bounds.height / 500, alignment: .top)
                            .background(.white)
                            .foregroundColor(.gray)
                        //  .frame(maxWidth:  UIScreen.main.bounds.width * 45 / 100 , alignment: .leading)
                        // .offset(x: CGFloat(65), y : CGFloat( 100) )
                    }
                    }
                .offset( y : CGFloat( 90) )
                
                Text("\(card.title ?? "")")
                    .font(Font.custom("MarkPro", size: 12))
                    .frame(maxWidth:  UIScreen.main.bounds.width * 40 / 100 , alignment: .leading)
                    .offset(x: CGFloat(15), y : CGFloat( 120) )
                    .foregroundColor(.black)
                
                
            }
        }
        
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

struct SelectCategoryFirstVerticalCard_Previews: PreviewProvider {
    static var previews: some View {
        SelectCategoryFirstVerticalCard( card: best_seller(), selectedTab: .constant(Tab.exploler), img: Image("imageNotFound"))
    }
}
