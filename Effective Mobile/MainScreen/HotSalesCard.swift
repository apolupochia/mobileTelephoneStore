//
//  HotSalesCard.swift
//  Effective Mobile
//
//  Created by Алёша Виноградов on 26.08.2022.
//

import SwiftUI

struct HotSalesCard: View {
    
    let columns  = 2
    
 
    
    @ObservedObject var fa = InfoForFistScreen()
    
    @Binding var tabSelection : Int
    @Binding var selectedTab : Tab
    @Binding var buttonBotBar : Bool
    
    @State var search = ""
    
    
    
    
     var genderArray = ["Zihuatanejo", "Gro", "Moscow", "Voroneg"]
    @State private var selectedIndex = 0
    
    let options: Array<String> = ["1", "2","3","4","5"]
    
    @State var selectedOptionsn = "Zihuatanejo"
    
    @State var chooseAdress = false

    
    var count = 0
    
    
    
//    init(){
//
//        fa.fetchInf()
//
//
//    }
    var body: some View {
        ZStack{
         //   ChooseAdress()
            
          
            
            
            VStack(spacing: 0){
               
                ChooseAdress(genderArray: genderArray, selectedOptionsn: $selectedOptionsn, chooseAdress: $chooseAdress)
                
                    SelectCategoryFirstHorizontalCard(button: $buttonBotBar)
                        .padding(.top, 10)
                       
                    
                    HStack{
                        TextField("Search", text: $search)
        //                    .padding(.vertical, 10)
        //                    .padding(.horizontal)
        //                    .background(Color.black.opacity(0.07))
        //                    .cornerRadius(10)
        //                    .padding(.top, 25)
        //                    .padding(.horizontal)
                        
                            .padding(10)
                            .padding(.leading, 36)
                            .background(.white)
                            .mask(RoundedRectangle(cornerRadius: 40, style: .continuous))
                            .overlay(
                                RoundedRectangle(cornerRadius: 40, style: .continuous)
                                .stroke()
                                .fill(.black.opacity(0.1))
                            )
                            .overlay(
                                Image(systemName: "magnifyingglass")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading,8)
                                    .foregroundColor(.black)
                        )
                            .padding(.vertical)
                            .padding(.leading, 20)
                          //  .padding(.trailing, 50)
                        
                        Button {
                            
                        } label: {
                            ZStack{
                                Circle()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(Color(hex: "FF6E4E"))
                                Image(systemName: "square.grid.2x2")
                                    .resizable()
                              //  .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color.white)
                                .frame(width: 20, height: 20)
                                 
                                
                                
                            }
                        }
                        .padding(.trailing, 20)

                    
                    }
                    HStack{
                        Text("Hot sales")
                            .font(Font.custom("MarkPro-Heavy", size: 25))
                            .padding(.leading, 16)
                        
                        Spacer()
                        
                        Button {
                        } label: {
                            Text("see more")
                        }
                        .padding(.trailing, 16)

                    }
                 
                    ScrollView(.vertical, showsIndicators: false) {
                        if let qw = fa.infForFirstScreen , let we = qw.home_store,  we.count == fa.imagesForHomeStore.count{
            
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 20){
                                        ForEach( 0..<Int(we.count)) { count in
                                            SelectCategorySecondHorizontalCard(selectedTab: $selectedTab, card: we[count], img: fa.imagesForHomeStore[count].img)

                                        }
                                    }
                                    .padding()
                                }

                        }
                        
                        if let qw = fa.infForFirstScreen , let we = qw.best_seller{
                            if we.count == fa.imagesForBestSeller.count{
                                ScrollView() {
                                    VStack(spacing: 20){
                                        
                                        ForEach(0..<Int(we.count)) { count in
                                            //   ForEach(we) { i in
                                            HStack{
                                                
                                                ForEach(0..<2){column in
                                                    if let index = indexFor(row: count, column: column, count : we.count ) {
                                                        SelectCategoryFirstVerticalCard(card: we[index],selectedTab: $selectedTab, img: fa.imagesForBestSeller[index].img)
                                                        
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                .padding()
                            }
                        }
                    }
  
              //  .background(.black)
       
                if buttonBotBar && fa.titles.count > 0{
                    BottomMenu(buttonBotBar: $buttonBotBar, titles: fa.titles, prices: fa.prices, sizes: fa.sizes, selectedTitle: fa.titles[0], selectedPrices: fa.prices[0], selectedSizes: fa.sizes[0], selectedTab: $selectedTab)
                        
                        
                }
            }
//            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
           // .padding(.top, 32)
            
            .background(Color(hex: "#F3F3F3"))
            
            if chooseAdress{
                need(genderArray: genderArray, selectedOptionsn: $selectedOptionsn, chooseAdress: $chooseAdress)
                    .offset(x: 0,  y: -325)
            }
            
            
      
            
          
            
        }
       
        
    }
    
    private func indexFor(row: Int, column: Int, count : Int ) -> Int? {
        let index = row * columns + column


        return index < count ? index : nil
    }

    

}
  



struct HotSalesCard_Previews: PreviewProvider {
    static var previews: some View {
        HotSalesCard(tabSelection: .constant(0), selectedTab: .constant(Tab.exploler), buttonBotBar: .constant(false))
    }
}

