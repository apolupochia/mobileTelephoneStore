//
//  BottomMenuSecondView.swift
//  Effective Mobile
//
//  Created by Алёша Виноградов on 30.08.2022.
//

import SwiftUI

struct BottomMenuSecondView: View {
//    @Binding var buttonBotBar : Bool
    let cart : SecondScreen
    @Binding var selectedTab : Tab
    
    @State var selectCategory = 1
    @State var selectColor = 1
    @State var selectMemory = 1
    
    
    var body: some View {

        ZStack{

            
            
            Rectangle()
           //     .mask(RoundedRectangle(cornerRadius: 34, style: .continuous))
                .cornerRadius(20)
                .foregroundColor(.white)
             //   .background(.blue)
         //   .fill(Color.white)
            .frame(width: UIScreen.main.bounds.width  , height: UIScreen.main.bounds.height / 2.3 )
            
            .onTapGesture {
                
            }
            VStack{
                Spacer()
                
                HStack{

                    
                    Text("\(cart.title ?? "")")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .offset(x: UIScreen.main.bounds.width  * 5 / 100)
                        .foregroundColor(.black)
                    

                    Button {
                        
                    } label: {
                        ZStack{
                        Rectangle()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.black.opacity(0.7))
                            .cornerRadius(10)
                            Image(systemName: "heart")
                                .frame(width: 25, height: 25)
                                .foregroundColor(.white)
                               // .background(.white)
                        }
                        .foregroundColor(.black)
                        
                            
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .offset(x: -UIScreen.main.bounds.width  * 5 / 100)
                    

                  
                }
                .padding(.top)
    
   
                
                    HStack{
                        Button {
                            
                        } label: {
                            Image(systemName: "star.fill")
                                .frame(width: 20, height: 20)
                                .foregroundColor(.blue)
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "star.fill")
                                .frame(width: 20, height: 20)
                                .foregroundColor(.blue)
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "star.fill")
                                .frame(width: 20, height: 20)
                                .foregroundColor(.blue)
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "star.fill")
                                .frame(width: 20, height: 20)
                                .foregroundColor(.blue)
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "star.fill")
                                .frame(width: 20, height: 20)
                                .foregroundColor(.blue)
                        }

                }
                .frame(maxWidth:  UIScreen.main.bounds.width, alignment: .leading)
                .offset(x : UIScreen.main.bounds.width * 5 / 100 )
                
                
               
                HStack{
                    VStack( spacing: 0){
                        
                        Button(action: {
                            
                            selectCategory = 1
                            
                        }, label: {
                            Text("Shop")
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                            
                        })
                        
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width / 5, height: UIScreen.main.bounds.height / 300, alignment: .top)
                            .background(.white)
                            .foregroundColor(selectCategory == 1 ? Color(hex: "FF6E4E") : .white)
                        
                    }
                    
                    Spacer()
                    
                    VStack( spacing: 0){
                        
                        Button(action: {
                            selectCategory = 2
                            
                        }, label: {
                            Text("Details")
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                            
                        })
                        
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width / 5, height: UIScreen.main.bounds.height / 300, alignment: .top)
                            .background(.white)
                            .foregroundColor(selectCategory == 2 ? Color(hex: "FF6E4E") : .white)
                        
                    }

                    Spacer()
                    
                    VStack( spacing: 0){
                        
                        Button(action: {
                            
                            selectCategory = 3
                            
                        }, label: {
                            Text("Feauters")
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                            
                        })
                        
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width / 5, height: UIScreen.main.bounds.height / 300, alignment: .top)
                            .background(.white)
                            .foregroundColor(selectCategory == 3 ? Color(hex: "FF6E4E") : .white)
                        
                    }
                     
                    
     
                }
                .frame(maxWidth : UIScreen.main.bounds.width , alignment: .leading)
                .padding(.top)
                .padding(.horizontal)
//
                HStack{
                    VStack{
                       Image(systemName: "circle.grid.hex.fill")
                            .resizable()
                            .frame(width: 25, height: 20)
                           
                        Text("\(cart.CPU ?? "")")
                            .font(.caption2)
                    }
                    .foregroundColor(Color.black.opacity(0.5))

                    Spacer()
                    
                    VStack{
                       Image(systemName: "camera")
                            .resizable()
                            .frame(width: 25, height: 20)
                        Text("\(cart.camera ?? "")")
                            .font(.caption2)
                    }
                    .foregroundColor(Color.black.opacity(0.5))
                    Spacer()
                    
                    VStack{
                       Image(systemName: "memorychip")
                            .resizable()
                            .frame(width: 25, height: 20)
                        Text("\(cart.sd ?? "")")
                            .font(.caption2)
                    }
                    .foregroundColor(Color.black.opacity(0.5))
  
                    
                    Spacer()
                    VStack{
                       Image(systemName: "simcard")
                            .resizable()
                            .frame(width: 25, height: 20)
                        Text("\(cart.ssd ?? "")")
                            .font(.caption2)
                    }
                    .foregroundColor(Color.black.opacity(0.5))
                }
                .padding(.top)
                .padding(.horizontal)
                .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
                
               
                Text("Select color and capacity")
                
                .padding()
                .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
                .foregroundColor(.black)
              
                HStack{
                    
                    
                    
                    

                    
                    
                    
                    Button {
                        selectColor = 1
                    } label: {
                        ZStack{
                            Circle()
                                .frame(width: 35, height: 35)
                                .foregroundColor(Color(hex: cart.color![0]))
                            if selectColor == 1{
                            Image(systemName: "checkmark")
                                .frame(width: 20, height: 20)
                                .foregroundColor(.white)
                            }
                        }
                    }

                    
                    
                    Button {
                        selectColor = 2
                    } label: {
                        ZStack{
                            Circle()
                                .frame(width: 35, height: 35)
                                .foregroundColor(Color(hex: cart.color![1]))
                            if selectColor == 2{
                                Image(systemName: "checkmark")
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.white)
                            }
                                
                        }
                    }
                    
                    Spacer()
                    
                    
                    Button {
                        selectMemory = 1
                    } label: {
                        Text("\(cart.capacity?[0] ?? "") gb")
                            .foregroundColor(selectMemory == 1 ? .white : .gray)
                            
                    }
                    .frame(width: 65, height: 25)
                    
                    .background(selectMemory == 1 ? Color(hex: "FF6E4E") : .white)
                    .cornerRadius(10)
                    
                    Button {
                        selectMemory = 2
                    } label: {
                        Text("\(cart.capacity?[1] ?? "") gb")
                            .foregroundColor(selectMemory == 2 ? .white : .gray)
                            
                    }
                    .frame(width: 65, height: 25)
                    .background(selectMemory == 2 ? Color(hex: "FF6E4E") : .white)
                    .cornerRadius(10)

                    
                }
                .padding(.horizontal)
                .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
        Spacer()
        
                ZStack(alignment: .bottom){
             
     Button {
                        selectedTab = Tab.gear
                        
                    } label: {
                        Text("Add to Cart       $ \(cart.price ?? 0)")
                            .foregroundColor(.white)
                    }
                    .frame(width: UIScreen.main.bounds.width * 8 / 10, height: UIScreen.main.bounds.height / 20)
                    .background(Color(hex: "FF6E4E"))
                    .cornerRadius(10)
                   

                    
                    
                    
                    
                }
                
 
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 15, alignment: .center)
                
            
            }
            .frame( maxHeight: UIScreen.main.bounds.height / 2.3, alignment: .top)
            .frame(width: UIScreen.main.bounds.width  , height: UIScreen.main.bounds.height / 2.3 )
           
            
        }
        .background(Color(hex: "#F3F3F3"))
    }
}


struct BottomMenuSecondView_Previews: PreviewProvider {
    static var previews: some View {
        BottomMenuSecondView(cart: SecondScreen(CPU: "1", camera: "2", capacity: ["2","3"], color: ["4","5"], id: "6", images: ["7","8"], isFavorites: true, price: 0, rating: 0, sd: "9", ssd: "10", title: "11"), selectedTab: .constant( Tab.exploler))
    }
}
//}
