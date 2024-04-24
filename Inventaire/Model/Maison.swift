//
//  Maison.swift
//  Inventaire
//
//  Created by Ezequiel Gomes on 15/03/2024.
//

import Foundation
import SwiftData
 
@Model
class Maison {
  //  var id : String
    var nom : String
   var espaces : [EspaceModel]
    
    init(nom: String, espaces: [EspaceModel]) {
       // self.id = UUID().uuidString
        self.nom = nom
        self.espaces = espaces
    }
    
    init(nom: String) {
       // self.id = UUID().uuidString
        self.nom = nom
        self.espaces = [EspaceModel(nom: "Tous mes produits", couleur: .green, imageName: "house",isfirstEspaceModel: true)]
    }
    
}

