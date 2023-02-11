//
//  need.swift
//  Effective Mobile
//
//  Created by Алёша Виноградов on 06.09.2022.
//

import SwiftUI

struct need: View {
    
   var genderArray : [String]
    @Binding var selectedOptionsn : String
    @Binding var chooseAdress : Bool
    
    var body: some View {
        VStack(){
        List(Array(genderArray), id: \.self){ i in
            Text(i)
                .onTapGesture {
                    withAnimation {
                        selectedOptionsn = i
                        chooseAdress = false
                    }
                    
                }

        }
        .overlay(
            RoundedRectangle(cornerRadius: 5, style: .continuous)
                .stroke(lineWidth: 1)
        )
        
        .listStyle(PlainListStyle())
        .frame(width: 300, height: 100 , alignment: .top)
        .background(.white)

            
    
        }
    }
}

struct need_Previews: PreviewProvider {
    static var previews: some View {
        need(genderArray: [""], selectedOptionsn: .constant(""), chooseAdress: .constant(false))
    }
}
