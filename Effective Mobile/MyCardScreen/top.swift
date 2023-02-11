//
//  top.swift
//  Effective Mobile
//
//  Created by Алёша Виноградов on 30.08.2022.
//

import SwiftUI

struct top: View {
    @Binding var count : Int
    @Binding var price : Int?
    var priceForThisPhone : Int
    
    let deviationX = UIScreen.main.bounds.width / 25
    let deviationY = UIScreen.main.bounds.height / (10 * 6)
    var body: some View {
        
      
        
        Button {
            if count > 0{
                count -= 1
                if price != nil{
                    price! = price! - priceForThisPhone
                }
            }
            
        } label: {
            ZStack{
                Path{ path in
                    
                    //  верхняя часть
                    
                            path.move(to: CGPoint(x: 0  , y: deviationY ))
                
            
                                path.addQuadCurve(
                                to: CGPoint(x: deviationX , y:  0  ),
                                control: CGPoint(x: 0 , y: 0 )
                                )
                
                                path.addQuadCurve(
                                to: CGPoint(x:  deviationX + deviationX , y:  deviationY),
                                control: CGPoint(x: 0 + deviationX + deviationX, y:  0 )
                                )
                    
                  
                    
                }
                Image(systemName: "minus")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width / 30, height: UIScreen.main.bounds.height / (8 * 10 * 6))
                    .foregroundColor(Color(hex: "#ffffff"))
                   
                
                
                
            }
                .foregroundColor(Color(hex: "#282843"))
         //       .frame( maxWidth: deviationX + deviationX, maxHeight: deviationY, alignment: .center)
                   
            }
        .frame( width: deviationX + deviationX, height: deviationY, alignment: .center)
    }
        
}

//struct top_Previews: PreviewProvider {
//    static var previews: some View {
//        top(count: .constant(0))
//    }
//}
