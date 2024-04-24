//
//  EspaceModel.swift
//  Inventaire
//
//  Created by Ezequiel Gomes on 14/03/2024.
//

import Foundation
import SwiftUI
import SwiftData


@Model

class EspaceModel: ObservableObject, Equatable  {
    var nom : String
    var couleur : [String : Double]
    var imageName : String
    var items : [Item] = []
    var itemRemove  : [Item] = []
    var isFirstEspaceModel = false
    
    init(nom: String, couleur: Color, imageName: String) {
        
        self.nom = nom
        self.couleur = couleur.getdictonnariesColor()
        self.imageName = imageName
        
    }
    init(nom: String, couleur: Color, imageName: String, isfirstEspaceModel : Bool) {
        
        self.nom = nom
        self.couleur = couleur.getdictonnariesColor()
        self.imageName = imageName
        self.isFirstEspaceModel = isfirstEspaceModel
        
    }
    static func == (lhs: EspaceModel, rhs: EspaceModel) -> Bool {
        return lhs.nom ==  rhs.nom
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(nom)
    }
    func getColor() -> Color {
        return Color(red: couleur["red"]!, green: couleur["green"]!, blue: couleur["blue"]!)
    }


    
   
    
}
