//
//  TabBar.swift
//  Effective Mobile
//
//  Created by Алёша Виноградов on 31.08.2022.
//


import SwiftUI
//import RiveRuntime

struct TabBar: View {
  //  @Binding var showMoreInf:Bool
    @Binding var selectedTab : Tab
 //   let icon = RiveViewModel(fileName: "icons", stateMachineName: "CHAT_Interactivity", artboardName: "CHAT")
    var body: some View {
        VStack {
            Spacer()
            HStack{
               content
            }
            
            
            .frame( height: 50)
            .padding(12)
           // .background(Color("Background 2").opacity(0.8))
            .background(Color(hex: "#010035"))
            .background(.ultraThinMaterial)
            .mask(RoundedRectangle(cornerRadius: 34, style: .continuous))
            .shadow(color: Color("Background 2").opacity(0.3), radius: 20, x: 0, y: 20)
          //  .frame(height: 1.0)
            .overlay(
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .stroke(.linearGradient(colors: [.white.opacity(0.5), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
            )
            //.padding(.horizontal, 24)
        }
     //   .padding(.bottom, UIScreen.main.bounds.height / 26)
        //     .padding(.bottom, UIScreen.main.bounds.height / 50)
        .ignoresSafeArea()
       
    }
    
    var content : some View{
        
        ForEach(tabItems) { item in
            Spacer()
            Button{
              // try?
                //item.icon.setInput("active", value: true)
                
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                //    try?
//                    item.icon.setInput("active", value: false)
//                }
//                withAnimation {
//                    if item.tab == Tab.chat{
//                        showMoreInf = true
//                    } else {
//                        showMoreInf = false
//                    }
                  //  selectedTab = item.tab
                self.selectedTab = item.tab
 //               }
            } label: {
                if item.icon == "exploler"{
                    HStack{
                    Circle()
                        .frame(width: 10, height: 10)
                        Text("Exploler")
                    }
                    .opacity(self.selectedTab == item.tab ? 1 : 0.7)
                    .foregroundColor(.white)
                    
                }

                Image(systemName: "\(item.icon)")
                //    .frame(height : 36)
                    .frame(height:  UIScreen.main.bounds.height / 26)
                    .opacity(self.selectedTab == item.tab ? 1 : 0.7)
//                    .background(
//                        VStack{
//                            RoundedRectangle(cornerRadius: 2)
//                                .fill(Color.accentColor)
//                                .frame(width: selectedTab == item.tab ? 20 : 0, height: 4)
//                                .offset(y: -4)
//                                .opacity(selectedTab == item.tab ? 1 : 0 )
//                            Spacer()
//                        }
//                    )
                    .foregroundColor(.white)
            }
            Spacer()
        }
        
    }
}
//
//}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(selectedTab: .constant(Tab.house))
    }
}

struct TabItem: Identifiable {
    var id = UUID()
    var icon: String
    var tab: Tab
}

var tabItems = [
    TabItem(icon: "exploler", tab: .exploler),
    TabItem(icon: "bag", tab: .house),
    TabItem(icon: "heart", tab: .gear),
    TabItem(icon: "person", tab: .gear),
  //  TabItem(icon: "cart", tab: .cart),

]

enum Tab: String {
    case exploler
    case house
    case gear
 //   case cart
}
