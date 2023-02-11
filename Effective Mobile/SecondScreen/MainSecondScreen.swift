//
//  MainSecondScreen.swift
//  Effective Mobile
//
//  Created by Алёша Виноградов on 29.08.2022.
//
//
import SwiftUI

struct MainSecondScreen: View {
    @ObservedObject var fd =  InfoForSecondScreen()
    
    @Binding var selectedTab : Tab


//    init(){
//        fd.fetchInf()
//
//    }
    
    
    var body: some View {
        ZStack{
            Color(hex: "#F3F3F3")
            VStack{
                if let info = fd.infoForSecondScreen, let img = fd.imagesCard, img.count == info.images?.count{
                    ads(cart: info,images: img, selectedTab: $selectedTab)
                }
                Spacer()
//                 Color(hex: "#F3F3F3")
//                    .frame(width: UIScreen.main.bounds.width, height: .infinity)
                if let info = fd.infoForSecondScreen{
                    BottomMenuSecondView(cart: info, selectedTab: $selectedTab)
                }
                
            }
            .background(Color(hex: "#F3F3F3"))
            .edgesIgnoringSafeArea(.bottom)
            .background(Color(hex: "#F3F3F3"))
            // .background(.black)
        }
        
    }
       
}

struct MainSecondScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainSecondScreen( selectedTab: .constant(Tab.exploler))
    }
}


