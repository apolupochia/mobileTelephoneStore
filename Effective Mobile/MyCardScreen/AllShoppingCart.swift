//
//  AllShoppingCart.swift
//  Effective Mobile
//
//  Created by Алёша Виноградов on 02.09.2022.
//

import SwiftUI

struct AllShoppingCart: View {
    @Binding var selectedTab : Tab
    var body: some View {
        VStack{
            TopInf(selectedTab: $selectedTab)
            Spacer()
            ShoppingCart()
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(Color(hex: "#EFEFEF"))
        .ignoresSafeArea()
    }
}

struct AllShoppingCart_Previews: PreviewProvider {
    static var previews: some View {
        AllShoppingCart(selectedTab: .constant(Tab.exploler))
    }
}
