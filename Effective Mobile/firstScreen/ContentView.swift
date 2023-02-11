//
//  ContentView.swift
//  Effective Mobile
//
//  Created by Алёша Виноградов on 23.08.2022.
//

// не нужно

import SwiftUI

struct ContentView: View {
    @ObservedObject var fa = InfoForFistScreen()
    init(){

        fa.fetchInf()
        
        
    }
//    init(){
//        print("123434")
//        fa.fetchInf()
//    }
    
    
    
    var body: some View {
        
        if fa.$infForFirstScreen != nil{
            if let qw = fa.infForFirstScreen , let we = qw.best_seller{
                Text("\(we.count)")
                ForEach(0..<(we.count ?? 2)) { count in
                   // Text((fa.infForFirstScreen?.best_seller![count].title)!)
                    FirstScreenCard(title: we[count].title, imageURL: we[count].picture)
//                    Text("\(we[count].id!)")
//                    
//                    Text("\(we[count].title!)")
//                    
//                    Text("\(we[count].picture!)")
                }
            } else {
                Text("Пусто")
            }
        }   else {
        
        ForEach(0..<(fa.infForFirstScreen?.best_seller?.count ?? 2)) { count in
           // Text((fa.infForFirstScreen?.best_seller![count].title)!)
            Text("\(count)")
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
