//
//  BottomMenu.swift
//  Effective Mobile
//
//  Created by Алёша Виноградов on 29.08.2022.
//

import SwiftUI

enum Topping: String, CaseIterable, Identifiable {
    case перекус, завтрак, обед, ужин
    var id: Self { self }
}

struct BottomMenu: View {
    
    @Binding var buttonBotBar : Bool
    
    var titles : [String]
    var prices : [String]
    var sizes  : [String]
    
    @State  var selectedTitle: String
    @State  var selectedPrices: String
    @State  var selectedSizes: String
    
    
    @Binding var selectedTab : Tab
    
    var body: some View {
        VStack{
            ZStack(alignment: .leading){
                Button {
                    withAnimation(.spring()){
                        buttonBotBar = false
                    }
                } label: {
                    Image(systemName: "clear.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.black)
                        .mask(RoundedRectangle(cornerRadius: 10 , style: .continuous))
                        
                }
                .frame(maxWidth:  UIScreen.main.bounds.width, alignment: .leading)

                .offset(x: UIScreen.main.bounds.width  * 5 / 100)
                
                Text("Filter options")
                    .frame(maxWidth: .infinity, alignment: .center)
                

                Button {
                    selectedTab = Tab.house
                } label: {
                    Text("Done")
                     
                        .frame(width: 60, height: 30)
                     
                        .mask(RoundedRectangle(cornerRadius: 10 , style: .continuous))
                        .background(Color(hex: "#d77d31"))
                        .foregroundColor(.white)
                        .mask(RoundedRectangle(cornerRadius: 5, style: .continuous))
                        
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .offset(x: -UIScreen.main.bounds.width  * 5 / 100)
                

              
            }
           
            VStack{
                Spacer()
                Text("Brand")
                    .frame(maxWidth : UIScreen.main.bounds.width , alignment: .leading)
                    .offset(x: UIScreen.main.bounds.width  * 5 / 100)
                
                Picker("Topping", selection: $selectedTitle) {
                    ForEach(Array(titles), id: \.self) { topping in
                        Text(topping)
                            .foregroundColor(.black)
                    }
                }
                .frame(width: UIScreen.main.bounds.width  * 80 / 100, height: 30)
              //  .foregroundColor(.black)
                .pickerStyle(.menu)
                .overlay(
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .stroke(lineWidth: 1)
                )
                
                
                Text("Price")
                    .frame(maxWidth : UIScreen.main.bounds.width , alignment: .leading)
                    .offset(x: UIScreen.main.bounds.width  * 5 / 100)
                Picker(selection: $selectedPrices, label: Text("rtr")) {
                    ForEach(Array(prices), id: \.self) { topping in
                        Text(topping)
                            .foregroundColor(.black)
                    }
                }
                .frame(width: UIScreen.main.bounds.width  * 80 / 100, height: 30)
              //  .foregroundColor(.black)
                .pickerStyle(.menu)
                .overlay(
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .stroke(lineWidth: 1)
                )
                
                Text("Size")
                    .frame(maxWidth : UIScreen.main.bounds.width , alignment: .leading)
                    .offset(x: UIScreen.main.bounds.width  * 5 / 100)
                
                Picker("Topping", selection: $selectedSizes) {
                    ForEach(Array(sizes), id: \.self) { topping in
                        Text(topping)
                            .foregroundColor(.black)
                    }
                }
                .frame(width: UIScreen.main.bounds.width  * 80 / 100, height: 30)
              //  .foregroundColor(.black)
                .pickerStyle(.menu)
                .overlay(
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .stroke(lineWidth: 1)
                )
            }
            
         //   .offset(x: UIScreen.main.bounds.width  * 5 / 100)
            
            
            
            
            

            .frame( maxHeight: UIScreen.main.bounds.height / 4, alignment: .top)
            

            
            
            
            
        }
        .frame(width: UIScreen.main.bounds.width  , height: UIScreen.main.bounds.height / 3 )
    }
}

struct BottomMenu_Previews: PreviewProvider {
    static var previews: some View {
        BottomMenu(buttonBotBar: .constant(true), titles: ["1", "2", "3"], prices: ["4", "5", "6"], sizes: ["7", "8", "9"], selectedTitle: "1", selectedPrices: "4", selectedSizes: "7", selectedTab: .constant(Tab.exploler))
    }
}
