//
//  Centre.swift
//  Effective Mobile
//
//  Created by Алёша Виноградов on 30.08.2022.
//

import SwiftUI

struct Centre: View {

    @Binding var count : Int
    
    let deviationX = UIScreen.main.bounds.width / 25 //+  UIScreen.main.bounds.width / 20
    let deviationY = UIScreen.main.bounds.height / (10 * 6) + UIScreen.main.bounds.height / (12 * 22)
    
    
    var body: some View {
        

        ZStack{
                    Path{ path in
                        
         
                        
                                path.move(to: CGPoint(x: 0 , y: 2 * deviationY))
                    
                
                                    path.addQuadCurve(
                                    to: CGPoint(x: 0, y: 0 ),
                                    control: CGPoint(x: 0, y: 0)
                                    )
                    
                                    path.addQuadCurve(
                                    to: CGPoint(x:  2 * deviationX, y: 0),
                                    control: CGPoint(x:  2 * deviationX, y: 0)
                                    )
                        
                                    path.addQuadCurve(
                                    to: CGPoint(x: 2 * deviationX, y: 2 * deviationY ),
                                    control: CGPoint(x: 2 * deviationX, y: 2 * deviationY )
                                    )
                        
                                    path.addQuadCurve(
                                    to: CGPoint(x: 0, y:  2 * deviationY ),
                                    control: CGPoint(x: 0, y: 2 * deviationY )
                                    )
                        

                                   
                    }
                    
                    Text("\(count)")
                .foregroundColor(Color(hex: "#ffffff"))
            
                
                }
                .foregroundColor(Color(hex: "#282843"))
                .frame( width: deviationX + deviationX, height: deviationY + deviationY, alignment: .center)
                   
    }
}

struct Centre_Previews: PreviewProvider {
    static var previews: some View {
        Centre(count: .constant(0))
    }
}
