//
//  ItemView.swift
//  Inventaire
//
//  Created by Ezequiel Gomes on 20/03/2024.
//

import SwiftUI

struct ItemView: View {
    @State var espace : EspaceModel
    @State var vue = 0
    @State var scanner = false
    
    var body: some View {
        VStack {
    
            Picker(selection:  $vue, label: Text("Selection")) {
                Text("Stock actuel ").tag(0)
                Text("produits épuisée ").tag(1)
            }.pickerStyle(.segmented).padding(.horizontal, 20.0)
            List{
                VueItems(items: $espace.items, removeItem: $espace.itemRemove, selection: $vue)
            }
            Button(action: {
                scanner.toggle()
                espace.objectWillChange.send()
            }, label: {
               Label("Ajouter des produits ", systemImage: "barcode.viewfinder")
            })
        }.sheet(isPresented: $scanner, content: {
            Scanner(produitExport: $espace.items)        }).navigationTitle(espace.nom)
            .toolbar(content: {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Menu {
                        Button(action: {
                            print("kkkkk")
                        }, label: {
                            Text("Button")
                        })

                    } label: {
                        Text("testMenu")
                    }

            }
        })
    }
}


#Preview {
    ItemView(espace: EspaceModel(nom: "Cave", couleur: Color(.green), imageName: "door.garage.open", isfirstEspaceModel: false), vue: 0)
}


