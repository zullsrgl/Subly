//
//  Route.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 29.03.2026.
//
import SwiftUI

enum Route: Hashable {
    case home
}

struct RouteView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path){
            HomeView()
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .home:
                    HomeView()
                }
            }
        }
    }
}
