//
//  ChooseAdress.swift
//  Effective Mobile
//
//  Created by Алёша Виноградов on 05.09.2022.
//

import SwiftUI


enum ToppingA: String, CaseIterable, Identifiable {
    case перекус, завтрак, обед, ужин
    var id: Self { self }
}


struct ChooseAdress: View {
    
    var genderArray : [String]
     @Binding var selectedOptionsn : String
     @Binding var chooseAdress : Bool

    var body: some View {
        ZStack{
            HStack{
                Image("location")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.leading, UIScreen.main.bounds.width / 5)
                    .background(Color(hex: "#F3F3F3"))
                
                Spacer()
                
                Button {
                    withAnimation {
                        chooseAdress.toggle()
                    }
                   
                    
                } label: {
                    HStack{
                        Spacer()
//                        Text("12312312132342331")
//                            .foregroundColor(.black)
//                            .lineLimit(1)
                        Text(selectedOptionsn)
                            .foregroundColor(.black)
                            .lineLimit(1)
                        Spacer()
                        Image("arrow")
                            .resizable()
                            .frame(width: 30, height: 20)
                            .foregroundColor(Color(hex: "#EFEFEF"))
                            .background(.black)
                    }
                }
                .padding(.trailing, UIScreen.main.bounds.width / 10)
                

               // Spacer()
                
                Image("outlined")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.trailing, 16)
                   // .background(Color(hex: "#EFEFEF"))
                    .background(Color(hex: "#F3F3F3"))

            
            }
            //.background(Color(hex: "#F3F3F3"))
            //.background(Color(hex: "#EFEFEF"))
            .background(Color(hex: "#F3F3F3"))
            .frame(width: UIScreen.main.bounds.width)
            .background(Color(hex: "#F3F3F3"))
       
          //  Spacer()
            
//            if chooseAdress{
//                need(genderArray: genderArray, selectedOptionsn: $selectedOptionsn, chooseAdress: $chooseAdress)
//                    .offset(x: 0, y: 100)
//            }
        }
    //    .background(Color(hex: "#F3F3F3"))
        .background(.black)
    
    }
    
}


struct ChooseAdress_Previews: PreviewProvider {
    static var previews: some View {
        ChooseAdress(genderArray: [""], selectedOptionsn: .constant(""), chooseAdress: .constant(false))
    }
}






