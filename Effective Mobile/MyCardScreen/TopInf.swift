//
//  TopInf.swift
//  Effective Mobile
//
//  Created by Алёша Виноградов on 02.09.2022.
//

import SwiftUI

struct TopInf: View {
    @Binding var selectedTab : Tab
    var body: some View {
        VStack{
        HStack{
            Button {
                selectedTab = Tab.exploler
            } label: {
                Image(systemName: "chevron.backward")
                    .foregroundColor(.white)
            }
            .frame(width: 37, height: 37)
           
            .background(Color(hex: "#010035"))
            .cornerRadius(11)

            Spacer()
            HStack{
                Spacer()
                Text("Add address")
//                    .font(.title2)
//                    .fontWeight(.bold)
                    .foregroundColor(.black)
           //     Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "bag")
                        .foregroundColor(.white)
                }
                .frame(width: 37, height: 37)
               
                .background(Color(hex: "#FF6E4E"))
                .cornerRadius(5)
            }
            
         //   Spacer()
            
           
        }
        .padding(.top, 79)
        .padding(.horizontal, 46)
            
            Text("My Card")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
          //      .padding(.top, 40)
           //     .frame(width: 138, height: 44, alignment: .leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 30)
                    .padding(.leading, 42)
        }
        
   
           

    }
}

struct TopInf_Previews: PreviewProvider {
    static var previews: some View {
        TopInf(selectedTab: .constant(Tab.house))
    }
}
