//
//  InventaireApp.swift
//  Inventaire
//
//  Created by Ezequiel Gomes on 14/03/2024.
//

import SwiftUI
import SwiftData

@main
struct InventaireApp: App {
    @StateObject private var check = CheckScannerDispo()
    var body: some Scene {
        WindowGroup {

            ContentView().environmentObject(check).task {
                await check.requestDataScannerAccessStatus()
            }.modelContainer(for : Maison.self)
        }
    }
}
