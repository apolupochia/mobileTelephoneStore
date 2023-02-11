//
//  SelectCategorySecondHorizontalCard.swift
//  Effective Mobile
//
//  Created by Алёша Виноградов on 28.08.2022.
//

import SwiftUI

struct SelectCategorySecondHorizontalCard: View {
    
 //   @Binding var tabSelection : Int
//    var stringUrlImage : String
    @Binding var selectedTab : Tab
    var card : home_store
    var img : Image
    
    var body: some View {
        ZStack{
          //  imggg(card: card)
            img
                .resizable()
                .frame(width: UIScreen.main.bounds.width / 1.2 , height: UIScreen.main.bounds.height / 4.5)
                .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
            //.padding()
           // .mask(Circle())
        
            if card.is_new != nil{
                
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color(hex: "#d77d31"))
                
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.2, alignment: .leading)
                    .frame(maxHeight: UIScreen.main.bounds.height / 4.5, alignment: .top)
                    .offset(x: CGFloat( 30), y : CGFloat( 15) )
                
                Text("New")
                    .font(.caption2)
                    .foregroundColor(.red)
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.2, alignment: .leading)
                    .frame(maxHeight: UIScreen.main.bounds.height / 4.5, alignment: .top)
                    .offset(x: CGFloat(33), y : CGFloat( 23) )
            }
            
            Text("\(card.title ?? "")")
                .font(.title)
                .frame(maxWidth: UIScreen.main.bounds.width / 1.2, alignment: .leading)
                .frame(maxHeight: UIScreen.main.bounds.height / 4.5, alignment: .top)
                .foregroundColor(.white)
                .offset(x: CGFloat(33), y : CGFloat( 60) )
            
            Text("\(card.subtitle ?? "")")
             //   .font(.title2)
                .frame(maxWidth: UIScreen.main.bounds.width / 1.2, alignment: .leading)
                .frame(maxHeight: UIScreen.main.bounds.height / 4.5, alignment: .top)
                .foregroundColor(.white)
                .offset(x: CGFloat(33), y : CGFloat( 100) )
            
            Button {
                selectedTab = Tab.gear
            //    tabSelection = 2
                
            } label: {
                Text("Buy now!")
                
                    .foregroundColor(.black)
   
                 //   .frame(maxWidth: UIScreen.main.bounds.width / 1.2, alignment: .leading)
                
                    

            }


            .frame(width: 135, height: 30)
            .background(.white)
            .mask(RoundedRectangle(cornerRadius: 5, style: .continuous))
            .frame(maxWidth: UIScreen.main.bounds.width / 1.2, alignment: .leading)
            .frame(maxHeight: UIScreen.main.bounds.height / 4.5, alignment: .top)
            
            .offset(x: CGFloat(33), y : CGFloat( 130) )
            

            
        }
        
    }
    

    
}

struct SelectCategorySecondHorizontalCard_Previews: PreviewProvider {
    static var previews: some View {
        SelectCategorySecondHorizontalCard(selectedTab: .constant(Tab.exploler), card: home_store(), img:  Image("imageNotFound"))
    }
}
