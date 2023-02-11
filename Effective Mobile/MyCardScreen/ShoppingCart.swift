//
//  ShoppingCart.swift
//  Effective Mobile
//
//  Created by Алёша Виноградов on 31.08.2022.
//

import SwiftUI

struct ShoppingCart: View {
    @ObservedObject var fd =  InfoForThirdScreen()
    
    
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 414, height: 690)
                .foregroundColor(Color(hex: "#010035"))
                .cornerRadius(30)
            
        VStack{
//            Text("Shopping Cart")
//                .font(.title2)
//                .fontWeight(.heavy)
//                .foregroundColor(Color(hex: "#ffffff"))
            
            ScrollView{
                if (fd.infoForThirdScreen != nil && fd.summPrice != nil){
                    
                   
            //        var index = 0
               //     price = sumPrice(fd: fd.infoForThirdScreen!.basket)
                    if (fd.infoForThirdScreen?.basket.count == fd.images.count){
                        ForEach(0..<fd.infoForThirdScreen!.basket.count){i in
                            if i < fd.images.count {
                                CardForMyCardScreen(fd: fd.infoForThirdScreen!.basket[i], price: $fd.summPrice, dd: fd, image: fd.images[i].img)
                            }
                      //      index += 1
                            
                        }
                    }
                }
//                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.5, alignment: .top)
            }
//            .frame(width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.height / 2, alignment: .top)
            .frame(width: UIScreen.main.bounds.width, height:  400, alignment: .top)
            .padding(.top, 40)
           
     //       Spacer()
            
            VStack{
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 300, alignment: .top)
                .background(.white)
                .foregroundColor(Color(hex: "#404067"))
            
            HStack{
                VStack(alignment: .leading, spacing: 10){
                    Text("Total")
                        .foregroundColor(.white)
                        
                    Text("Delivery")
                        
                        .foregroundColor(.white)
                }
                .padding(.leading, UIScreen.main.bounds.width * 15 / 100)
                Spacer()
                VStack(alignment: .leading, spacing: 10){
                    
                    if (fd.infoForThirdScreen != nil){
                        Text("$\(fd.summPrice!) us")
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                    }
                    Text("\(fd.infoForThirdScreen?.delivery ?? "Free")")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                }
                .padding(.trailing, UIScreen.main.bounds.width * 15 / 100)
            }
            .padding(.top)
            
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 400, alignment: .top)
                .background(.white)
                .foregroundColor(Color(hex: "#404067"))
            
         //   Spacer()
            
            Button {
                
            } label: {
                Text("Checkout")
                    .fontWeight(.heavy)
                 
                    
            }
            .foregroundColor(.white)
            .frame(width: 326, height: 54 )
          
            .background(Color(hex: "#ff6d4e"))
            .cornerRadius(10)
          //  Spacer()
            }
      //      .padding(.bottom, UIScreen.main.bounds.height / 100 + 58.5)
            
            
          
            

            
        }
        
    
           
    }
        .background(Color(hex: "#EFEFEF"))
        
    }
    
    func sumPrice(fd : [basket]) -> Int{
        var sum = 0
        for i in fd{
            sum += i.price ?? 0
        }
       // price = sum
        return sum

    }
        
}

struct ShoppingCart_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCart()
    }
}
