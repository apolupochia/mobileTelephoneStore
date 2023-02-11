//
//  SelectCategoryFirstHorizontalCard.swift
//  Effective Mobile
//
//  Created by Алёша Виноградов on 24.08.2022.
//

import SwiftUI

struct SelectCategoryFirstHorizontalCard: View {
    var category : SelectCategory = .phones
    @Binding var button : Bool
    @State var select : TabFirstScreenTop = .phone
    
    
    
    
    
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
            Text("Select Category")
              //  .font(.title)
                .font(Font.custom("MarkPro-Heavy", size: 25))
               // .fontWeight(.heavy)
                .padding([.leading],16)
                .lineLimit(1)
                .foregroundColor(.black)

                
                Spacer()
                Button {
                    withAnimation(.spring()){
                        button.toggle()
                    }
                    
                    
                } label: {
                    Text("view all")
                }
                .offset(x: -UIScreen.main.bounds.width * 5 / 100)


            }
            .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 20){
                
                ForEach(tabItemsFirstScreenTop){ item in
                    
  
                    Button{
                    //    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        withAnimation {
                            self.select = item.tab
                        }

                    } label: {
                        VStack(alignment: .center, spacing: 5){
                            ZStack{
                                
                                Circle()
                                    .frame(width: 71, height: 71)
                                    .foregroundColor(self.select == item.tab ? Color(hex: "FF6E4E") : .white)
                                
                                Image(systemName: "\(item.icon)")
                                    .fixedSize()
                                    .frame(width: 33, height: 33)
                                    .foregroundColor(self.select == item.tab ? .white : Color.black.opacity(0.5))
             
                                    .frame(height:  UIScreen.main.bounds.height / 26)
       
                                    .foregroundColor(.white)
                                
                            }
                            Text("\(item.name)")
                        }
                        
                       

                    }
  
                }
                

            
            }
               // .frame(width: .infinity)
            .padding(.leading, 16)
            }
           // Image()
        
        
        }
        .frame(width: UIScreen.main.bounds.width )
     //  .background(Color(hex: "#EFEFEF"))
       .background(Color(hex: "#F3F3F3"))
    }
}

struct SelectCategoryFirstHorizontalCard_Previews: PreviewProvider {
    static var previews: some View {
        SelectCategoryFirstHorizontalCard(button: .constant(false))
    }
}







struct TabItemFirstScreenTop: Identifiable {
    var id = UUID()
    var icon: String
    var tab: TabFirstScreenTop
    var name : String
}

var tabItemsFirstScreenTop = [
    TabItemFirstScreenTop(icon: "phone", tab: .phone, name: "Phones"),
    TabItemFirstScreenTop(icon: "bag", tab: .computer, name: "Computer"),
    TabItemFirstScreenTop(icon: "heart", tab: .hearth, name: "Health"),
    TabItemFirstScreenTop(icon: "person", tab: .books, name: "Books"),
    TabItemFirstScreenTop(icon: "person", tab: .books, name: "Books"),
    TabItemFirstScreenTop(icon: "person", tab: .books, name: "Books")
  //  TabItem(icon: "cart", tab: .cart),

]

enum TabFirstScreenTop: String {
    case phone
    case computer
    case hearth
    case books
 //   case cart
}
