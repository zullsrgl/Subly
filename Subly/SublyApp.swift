//
//  SublyApp.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 29.03.2026.
//

import SwiftUI
import SwiftData

@main
struct SublyApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .preferredColorScheme(.dark)
        }
        .modelContainer(for: ServicesModel.self)
    }
}
