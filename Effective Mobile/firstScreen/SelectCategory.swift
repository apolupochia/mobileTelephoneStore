//
//  SelectCategory.swift
//  Effective Mobile
//
//  Created by Алёша Виноградов on 23.08.2022.
//

import Foundation



struct firstScreen : Codable{
    
    let home_store : [home_store]?
    let best_seller : [best_seller]?
    
}


struct best_seller : Codable, Identifiable{
    var id : Int?
    var is_favorites : Bool?
    var title : String?
    var price_without_discount : Int?
    var discount_price : Int?
    var picture : String?
}



struct home_store : Codable, Identifiable{
    var id : Int?
    var is_new : Bool?
    var title : String?
    var subtitle : String?
    var picture :  String?
    var is_buy : Bool?
}
