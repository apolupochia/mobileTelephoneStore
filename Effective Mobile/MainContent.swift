//
//  MainContent.swift
//  Effective Mobile
//
//  Created by Алёша Виноградов on 31.08.2022.
//

import SwiftUI
import UIKit
struct MainContent: View {
    
    @State var selectedTab = Tab.exploler
    @State var color = Color(hex: "#F3F3F3")
    
    @State private  var tabSelection = 0
    
    @State var buttonBotBar = false

    
    var body: some View {
  //      TabView(selection: $tabSelection){
        
        Group{
            switch selectedTab {
            case .exploler:
                
            //    MainSecondScreen( selectedTab: $selectedTab)
                ZStack{
//
                    HotSalesCard(tabSelection: $tabSelection, selectedTab: $selectedTab, buttonBotBar: $buttonBotBar)
//
               //     Spacer()
                    if !buttonBotBar{
                    TabBar(selectedTab: $selectedTab)
                    }
//
//
               }
            case .house:
                //Text("")
                MainSecondScreen( selectedTab: $selectedTab)
                
            case .gear:
               // Text("")
                AllShoppingCart(selectedTab: $selectedTab)
                
//            case .cart:
//                HotSalesCard(tabSelection: $tabSelection, selectedTab: $selectedTab, buttonBotBar: $buttonBotBar)
            }
            
            
            
//                .tabItem {
//                    Image(systemName: "house")
//                }
//                .tag(0)
//
//
//            MainSecondScreen()
//
//
//                .tabItem {
//                    Image(systemName: "gear")
//
//                }
//                .tag(1)
//
//
//                ShoppingCart()
//                    .tabItem {
//                        Image(systemName: "cart")
//
//
//                    }
//                    .tag(2)
//
            
        }
        
        
//        HotSalesCard(tabSelection: $tabSelection)
//        .tabItem {
//            Image(systemName: "house")
//        }
//        .tag(0)
//
//
//    MainSecondScreen()
//
//
//        .tabItem {
//            Image(systemName: "gear")
//
//        }
//        .tag(1)
//
//
//        ShoppingCart()
//            .tabItem {
//                Image(systemName: "cart")
//
//
//            }
//            .tag(2)
            
//        }
//        .tabViewStyle(backgroundColor: color,
//                      itemColor: .white,
//                      selectedItemColor: .blue,
//                      badgeColor: .green)
//
//
//
//        ZStack{
//          //  Color(hex: "#f2f2f4")
//            Group{
//
//                switch selectedTab {
//                case .house:
//                    HotSalesCard()
//                case .gear:
//                    MainSecondScreen()
//                case .cart:
//                    ShoppingCart()
//                }
//            }
//            TabBar(selectedTab: $selectedTab)
//        }
    }
}

struct MainContent_Previews: PreviewProvider {
    static var previews: some View {
        MainContent()
    }
}




extension Color {
  var uiColor: UIColor? {
    if #available(iOS 14.0, *) {
      return UIColor(self)
    } else {
      let scanner = Scanner(string: self.description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
      var hexNumber: UInt64 = 0
      var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
      let result = scanner.scanHexInt64(&hexNumber)
      if result {
        r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
        g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
        b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
        a = CGFloat(hexNumber & 0x000000ff) / 255
        return UIColor(red: r, green: g, blue: b, alpha: a)
      } else {
        return nil
      }
    }
  }
}


extension View {
  func tabViewStyle(backgroundColor: Color? = nil,
                    itemColor: Color? = nil,
                    selectedItemColor: Color? = nil,
                    badgeColor: Color? = nil) -> some View {
    onAppear {
      let itemAppearance = UITabBarItemAppearance()
      if let uiItemColor = itemColor?.uiColor {
        itemAppearance.normal.iconColor = uiItemColor
        itemAppearance.normal.titleTextAttributes = [
          .foregroundColor: uiItemColor
        ]
      }
      if let uiSelectedItemColor = selectedItemColor?.uiColor {
        itemAppearance.selected.iconColor = uiSelectedItemColor
        itemAppearance.selected.titleTextAttributes = [
          .foregroundColor: uiSelectedItemColor
        ]
      }
      if let uiBadgeColor = badgeColor?.uiColor {
        itemAppearance.normal.badgeBackgroundColor = uiBadgeColor
        itemAppearance.selected.badgeBackgroundColor = uiBadgeColor
      }

      let appearance = UITabBarAppearance()
      if let uiBackgroundColor = backgroundColor?.uiColor {
        appearance.backgroundColor = uiBackgroundColor
      }

      appearance.stackedLayoutAppearance = itemAppearance
      appearance.inlineLayoutAppearance = itemAppearance
      appearance.compactInlineLayoutAppearance = itemAppearance

      UITabBar.appearance().standardAppearance = appearance
      if #available(iOS 15.0, *) {
        UITabBar.appearance().scrollEdgeAppearance = appearance
      }
    }
  }
}
