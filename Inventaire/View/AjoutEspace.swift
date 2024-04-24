//
//  AjoutEspace.swift
//  Inventaire
//
//  Created by Ezequiel Gomes on 14/03/2024.
//

import SwiftUI

struct AjoutEspace: View {
    @Bindable var maison : Maison
    @State var logo = ""
    @State var nomEspace = ""
    @State var couleur = Color(.green)
    @State var choixLogo = ""
    @State private var buttonStates = Array(repeating: false, count: 6)
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    
    var nomsLogo = ["bathtub","door.sliding.left.hand.closed","door.garage.open","house","refrigerator","cabinet"]
    let rows = [
        GridItem(),
        GridItem()
    ]
    var body: some View {
        VStack {
            Section( header: Text("Ajouter un espace:" )){
                HStack {
                    Text("Nom de l'espace :")
                    TextField(text: $nomEspace){
                        Text("Nom de l'Espace ")
                    }
                }
            }
            
            
          
            ColorPicker("Couleur : ", selection: $couleur).padding(.horizontal, 45)
            Text("Logo :").padding(.bottom)
            
            LazyVGrid(columns: [GridItem(),GridItem(), GridItem()], content: {
                ForEach(nomsLogo.indices, id: \.self) { i in
                    Button(action: {
                        choixLogo = nomsLogo[i]
                        buttonStates = Array(repeating: false, count: 6)
                        buttonStates[i].toggle()
                        
                    }, label: {
                        ZStack {
                            Image(systemName: nomsLogo[i]).resizable().scaledToFit().frame(width: 40)
                            Circle().frame(width: 70).foregroundStyle(Color((self.buttonStates[i] ? .gray : .clear))).opacity(0.4)
                            
                        }
                    }).foregroundStyle(Color(.black))
                }
            })
            Spacer()
            Button(action: {
                maison.espaces.append(EspaceModel(nom: nomEspace, couleur: couleur, imageName: choixLogo))
                
                dismiss()
            }, label: {
                Label("Ajouter", systemImage: "plus.app").font(.system(size: 25))
            })
            
            
        }.padding(15.0)
        
        
    }
}

//#Preview {
//    AjoutEspace(maison: .constant(Maison(nom: "My House", espaces: [EspaceModel(nom: "Tous mes Produis", couleur: Color( red: 0.71, green: 0.45, blue: 0.20), imageName: "bag.fill")])))
//}
