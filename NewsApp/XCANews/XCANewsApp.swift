//
//  XCANewsApp.swift
//  XCANews
//
//  Created by Madi Keshilbayev on 01.05.2022.
//

import SwiftUI

@main
struct XCANewsApp: App {
    
    @StateObject var articleBookmarkVM = ArticleBookmarkViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(articleBookmarkVM)
        }
    }
}
