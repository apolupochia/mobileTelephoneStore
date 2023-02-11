//
//  CardForMyCardScreen.swift
//  Effective Mobile
//
//  Created by Алёша Виноградов on 30.08.2022.
//



import SwiftUI

struct CardForMyCardScreen: View {
    var fd : basket
    @State var count = 1
    @Binding var price : Int?
    @ObservedObject var dd : InfoForThirdScreen

    let image : Image
    
    var body: some View {
        
        HStack{
            
            //ImageThirdCart( url: fd.images!)
            image
                .resizable()
                .frame(width: UIScreen.main.bounds.height / 12 , height: UIScreen.main.bounds.height / 12 )
            
            VStack(alignment: .leading){
                Text("\(fd.title!)")
                   // .font(.title2)
                    .font(.system(size: 15))
                    .fontWeight(.bold)
              //      .frame( height: .infinity )
                    .lineLimit(2)
                    .foregroundColor(Color(hex: "#ffffff"))
                    .padding(.top, 5)
                Spacer()
                Text("$\(fd.price!)")
                 //   .font(.title3)
                    //.fontWeight(.)
                    .foregroundColor(.red)
                    //   .frame(maxWidth : .infinity, alignment: .leading)
                    .padding(.bottom, 5)
            }
            .frame(width: UIScreen.main.bounds.height / 5, height: UIScreen.main.bounds.height / 12, alignment: .leading )
            
            VStack( spacing: 0){
                top(count: $count, price: $price, priceForThisPhone: fd.price!)
                Centre(count: $count)
                Bottom(count: $count, price: $price, priceForThisPhone: fd.price!)
                
            }
            .padding(.horizontal)
            
            Button {
                if dd.images.count <= 1{
                    dd.infoForThirdScreen?.basket = []
                    dd.images = []
                } else {
                    dd.infoForThirdScreen?.basket.remove(at: fd.id! - 1)
                    dd.images.remove(at: fd.id! - 1)
                }
                if price != nil{
                    price! = price! - count * fd.price!
                }
            } label: {
                Image(systemName: "trash")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(Color(hex: "#33324a"))
            }


         }
        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
        .padding(.leading,48)

            
                            

    }
}

//struct CardForMyCardScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        CardForMyCardScreen(fd: basket(from: <#Decoder#>))
//    }
//}



//
//import SwiftUI
//
//struct CardForMyCardScreen: View {
//    @State var count = 0
//    var body: some View {
//        HStack{
//
//            Image(systemName: "heart")
//                .resizable()
//                .frame(width: UIScreen.main.bounds.height / 12 , height: UIScreen.main.bounds.height / 12 )
//
//                .foregroundColor(.white)
//
//            VStack(alignment: .leading){
//                Text("Galaxy wefwfwfwfewwef 0")
//                   // .font(.title2)
//                    .font(.system(size: 15))
//                    .fontWeight(.bold)
//              //      .frame( height: .infinity )
//                    .frame( maxHeight: .infinity)
//                    .lineLimit(2)
//                    .foregroundColor(Color(hex: "#ffffff"))
//                    .padding(.top, 5)
//
//
//                Spacer()
//
//                Text("$3000.00")
//                //   .font(.title3)
//                   //.fontWeight(.)
//                   .foregroundColor(.red)
//                   //   .frame(maxWidth : .infinity, alignment: .leading)
//                   .padding(.bottom, 5)
//            }
//            .frame(width: UIScreen.main.bounds.height / 4.7, height: UIScreen.main.bounds.height / 12, alignment: .leading )
//
//            VStack( spacing: 0){
//                top(count: $count)
//                Centre(count: $count)
//                Bottom(count: $count)
//
//            }
//            .padding(.horizontal)
//
//            Button {
//
//            } label: {
//                Image(systemName: "trash")
//                    .resizable()
//                    .frame(width: 25, height: 25)
//                    .foregroundColor(Color(hex: "#33324a"))
//            }
//            .frame( maxWidth: .infinity, alignment: .trailing)
//            .padding(.trailing, 35)
//
//
//
//
//         }
//        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
//        .padding(.leading,48)
//        .background(Color(hex: "#010035"))
//
//
//
//    }
//}

//struct CardForMyCardScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        CardForMyCardScreen()
//    }
//}



//           Path{ path in
//                path.move(to: CGPoint(x: UIScreen.main.bounds.width / 10, y: 0))
//
//
//                path.addQuadCurve(
//                to: CGPoint(x: UIScreen.main.bounds.width - UIScreen.main.bounds.width / 10, y: 2),
//                control: CGPoint(x: UIScreen.main.bounds.width - UIScreen.main.bounds.width / 10 , y: 2)
//                )
//
//                path.addQuadCurve(
//                to: CGPoint(x: UIScreen.main.bounds.width - UIScreen.main.bounds.width / 20 , y:  UIScreen.main.bounds.height / 25),
//                control: CGPoint(x: UIScreen.main.bounds.width - UIScreen.main.bounds.width / 20 , y: 2)
//                )
//
//                path.addQuadCurve(
//                to: CGPoint(x: UIScreen.main.bounds.width - UIScreen.main.bounds.width / 20, y: UIScreen.main.bounds.height / 20 ),
//                control: CGPoint(x: UIScreen.main.bounds.width - UIScreen.main.bounds.width / 20, y: UIScreen.main.bounds.height / 20 )
//                )
//
//                path.addQuadCurve(
//                to: CGPoint(x: UIScreen.main.bounds.width / 20, y: UIScreen.main.bounds.height / 20),
//                control: CGPoint(x: UIScreen.main.bounds.width / 20, y: UIScreen.main.bounds.height / 20)
//                )
//
//                path.addQuadCurve(
//                to: CGPoint(x: UIScreen.main.bounds.width / 20, y: UIScreen.main.bounds.height / 25),
//                control: CGPoint(x: UIScreen.main.bounds.width / 20, y: UIScreen.main.bounds.height / 25)
//                )
//
//                path.addQuadCurve(
//                to: CGPoint(x:  UIScreen.main.bounds.width / 10, y: 0),
//                control: CGPoint(x: UIScreen.main.bounds.width / 20 , y: 0)
//                )
