//
//  ads.swift
//  Effective Mobile
//
//  Created by Алёша Виноградов on 29.08.2022.
//

//import SwiftUI
//
//struct ads: View {
//    @ObservedObject var fa = InfoForFistScreen()
//    @State var ff : [Card]? = nil
//
//    
//    init(){
//        fa.fetchInf()
//        ff = fa.images
//
//    }
//    
//    
//    var body: some View {
//        if let count =  fa.count,  count == fa.images.count  {
//            Home(fa: fa.images, ind: fa.images.count)
//        }
//       
//    }
//}
//
//struct ads_Previews: PreviewProvider {
//    static var previews: some View {
//        ads()
//    }
//}
//
//struct Home : View{
//    let fa : [Card]
//     var ind : Int
//    @State var search = ""
//    @State var index = 0
//    var body: some View{
//        ScrollView(.vertical, showsIndicators: false) {
//            
//            LazyVStack{
//                HStack{
//                    Text("Phones")
//                        .font(.title)
//                        .fontWeight(.bold)
//                    
//                    Spacer()
//                }
//                .padding(.horizontal)
//                
////                TextField("Search", text: $search)
////                    .padding(.vertical, 10)
////                    .padding(.horizontal)
////                    .background(Color.black.opacity(0.07))
////                    .cornerRadius(10)
////                    .padding(.top, 25)
//                
//                
//                TabView(selection: $index){
//                    ForEach(0..<ind){ index in
//                        Image(uiImage: fa[index].img)
//                            .resizable()
//                            .frame(height: self.index == index ? 230 : 180)
//                            .cornerRadius(15)
//                            .padding(.horizontal)
//                        
//                            .tag(index)
//                    }
//                    
//                }
//                .frame( height: 230)
//                .padding(.top, 25)
//                .tabViewStyle(PageTabViewStyle())
//                .animation(.easeOut)
//                
//                
//            }
//            .padding(.vertical)
//            
//            
//        }
//        .background(Color.black.opacity(0.05).edgesIgnoringSafeArea(.all))
//        
//        
//        
//        
//    }
//}


import SwiftUI

struct ads: View {
//    @ObservedObject var fa = InfoForFistScreen()
//    @State var ff : [Card]? = nil
    let cart : SecondScreen
    let images : [CardSecond]
    @Binding var selectedTab : Tab
   
//    init(){
//        images.addImg(cart: cart)
//
//    }
    
    
    var body: some View {
        //let images = saveImg(cart: cart)
      //  if let count =  fa.count,  count == fa.images.count  {
    //    if images.images.count == cart.images?.count{
            Home(cart: cart, images: images, ind: images.count, selectedTab: $selectedTab)
            .background(Color.black.opacity(0.05).edgesIgnoringSafeArea(.all))
  //      }
       // }
       
    }
}

//struct ads_Previews: PreviewProvider {
//    static var previews: some View {
//        ads(cart: SecondScreen(CPU: "12", camera: "23", capacity: ["1","2"], color: ["2","3"], id: "1", images: ["1","2"], isFavorites: false, price: 12.1, rating: 100, sd: "2", ssd: "128", title: "tyt"), images: [])
//    }
//}

struct Home : View{
    let cart : SecondScreen
    let images : [CardSecond]
     var ind : Int
    @Binding var selectedTab : Tab
    @State var image : UIImage = UIImage(systemName: "photo")!
    @State var search = ""
    @State var index = 0
    var body: some View{
        ScrollView(.vertical, showsIndicators: false) {
            
            LazyVStack{
                HStack{
                    Button {
                        selectedTab = Tab.exploler
                    } label: {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.white)
                    }
                    .frame(width: 37, height: 37)
                   
                    .background(Color(hex: "#010035"))
                    .cornerRadius(11)

                    Spacer()
                    
                    Text("Phones")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "bag")
                            .foregroundColor(.white)
                    }
                    .frame(width: 37, height: 37)
                   
                    .background(Color(hex: "#FF6E4E"))
                    .cornerRadius(5)
                    
                 //   Spacer()
                }
                .padding(.horizontal)
                
//                TextField("Search", text: $search)
//                    .padding(.vertical, 10)
//                    .padding(.horizontal)
//                    .background(Color.black.opacity(0.07))
//                    .cornerRadius(10)
//                    .padding(.top, 25)
                
                
                TabView(selection: $index){
                    ForEach(0..<ind){ index in
                        Image(uiImage: images[index].img)
                            .resizable()
                            .frame(height: self.index == index ? 230 : 180)
                            .cornerRadius(15)
                            .padding(.horizontal)

                            .tag(index)
                    }

                }
                .frame( height: 230)
                .padding(.top, 25)
                .tabViewStyle(PageTabViewStyle())
                .animation(.easeOut)
                
                
            }
          //  .padding(.top)
            
            
        }
        .background(Color(hex: "#F3F3F3"))
        
        
        
        
        
    }
     
    
    
    
    

}

class saveImg : ObservableObject{
    
    var cart : SecondScreen
    
    init(cart : SecondScreen){
        self.cart = cart
        addImg(cart: cart)
    }
    
    @State var image : UIImage = UIImage(systemName: "photo")!
    
    @Published var images : [UIImage] = []
    
    func addImg(cart : SecondScreen){
        for cart in cart.images!{
            imageCard(url: cart)
        }
        
    }
    
    
    
    func imageCard(url : String)  {

     //  var image : Image = Image(systemName: "person")

       guard let url = URL(string: url) else {return }


       URLSession.shared.dataTask(with: url) { (data, response, error) in
           if let error = error {
               print(error)
               return
           }

           if let response = response {
               print(response)
           }

           if let data = data, let imageUI = UIImage(data: data) {
               // let image = Image(uiImage: imageUI)
               DispatchQueue.main.async {
                   self.images.append(imageUI)
               }
           }

       }.resume()
       

   }
}
