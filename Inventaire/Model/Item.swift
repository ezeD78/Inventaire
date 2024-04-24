//
//  Item.swift
//  Inventaire
//
//  Created by Ezequiel Gomes on 20/03/2024.
//

import Foundation
import SwiftData
import SwiftUI
enum type {
    case sec
    case frais
    case nonAlimentaire
    case nondeterminer
}

@Model

class Item : Hashable  {
    
    let id : String
    let ean : String
    let nom : String
    let marque : String
    let quantite : String
    let dlc : Date?
    var unite  = 1
    var dateAjout = Date()
    var dateOuverture : Date? 
    let urlImage : String
    //var type : type = .nondeterminer
    
    init(item : ItemData) {
        self.id = UUID().uuidString
        self.ean = item.code
        
        if  let safeName = item.product.product_name_fr {
            self.nom = safeName
        }
        else if let safeName = item.product.ecoscore_data.agribalyse.name_fr {
            self.nom = safeName
        }
        else {
            self.nom = ""
        }
        self.marque = item.product.brands
        self.quantite = item.product.quantity
        self.urlImage = item.product.image_front_small_url
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.ean == rhs.ean
    }
    
    func depuisQuand() -> String {
        let calendar = Calendar.current
        let tempsecouler = calendar.dateComponents([.day], from: self.dateOuverture!, to: .now)
        
        return tempsecouler.day?.description ?? "-1"
    }
    
}

struct ItemData : Decodable {
    let code : String
    let status : Int
    let product : Product
    
}


struct Product : Decodable {
    let ecoscore_data : Ecoscore
    let brands : String
    let conservation_conditions_fr : String?
    let image_front_small_url : String
    let quantity : String
    let product_name_fr : String?
}

struct Ecoscore : Decodable {
    let agribalyse : Agribalyse
}


struct Agribalyse  : Decodable {
    let name_fr : String?
    
}

