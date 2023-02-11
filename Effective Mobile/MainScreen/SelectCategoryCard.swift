//
//  SelectCategoryCard.swift
//  Effective Mobile
//
//  Created by Алёша Виноградов on 24.08.2022.
//

import SwiftUI

enum SelectCategory : String{
    case phones = "iphone"
    case computer = "desktopcomputer"
    case heart = "heart"
    case books = "books.vertical"
}

struct SelectCategoryCard: View {
    let category : SelectCategory
    @Binding var select : SelectCategory
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 70   , height: 70)
                // .background(.white)
                .foregroundColor(category.rawValue == select.rawValue ? Color(hex: "#d77d31") : .white)
            Image(systemName: category.rawValue)
            .resizable()
          //  .background(.blue)
            .frame(width:35, height: 35)
            .mask(Circle())
            .foregroundColor(.black)
        }
        
           
    }
}

struct SelectCategoryCard_Previews: PreviewProvider {
    static var previews: some View {
        SelectCategoryCard(category: SelectCategory.phones,select: .constant(SelectCategory.phones))
    }
}
