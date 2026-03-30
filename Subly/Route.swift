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
enum Sheet: Identifiable {
    case create
    var id: String { String(describing: self) }
    
}

struct MainTabView: View {
    @State private var path = NavigationPath()
    @State private var selectedTab = 0
    @State private var activeSheet: Sheet?
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            NavigationStack(path: $path) {
                HomeView(activeSheet: $activeSheet)
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                        case .home: HomeView(activeSheet: $activeSheet)
                            
                        }
                    }
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            .tag(0)
        }
        .tint(Color(uiColor: Colors.secondary500))
        .sheet(item: $activeSheet){ item in
            switch item {
            case .create:
                NavigationStack{
                    CreateView()
                }
            }
        }
    }
}
