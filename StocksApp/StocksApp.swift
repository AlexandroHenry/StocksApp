//
//  StocksAppApp.swift
//  StocksApp
//
//  Created by Seungchul Ha on 2022/10/24.
//

import SwiftUI

@main
struct StocksApp: App {
    
    @StateObject var appVM = AppViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MainListView()
            }
            .environmentObject(appVM)
        }
    }
}
