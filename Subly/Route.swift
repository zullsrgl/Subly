//
//  Route.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 29.03.2026.
//
import SwiftUI

enum Route: Hashable {
    case home
    case notifications
    case search
    case analysis
}

enum Sheet: Identifiable {
    case create
    var id: String { String(describing: self) }
    
}

struct MainTabView: View {
    @State private var homePath = NavigationPath()
    @State private var searchPath = NavigationPath()
    @State private var analysisPath = NavigationPath()
    
    @State private var selectedTab = 0
    @State private var activeSheet: Sheet?
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            NavigationStack(path: $homePath) {
                HomeView(activeSheet: $activeSheet, path: $homePath)
                    .navigationDestination(for: Route.self) { route in
                        viewFactory(for: route)
                    }
            }
            .tabItem {
                Text("Home")
                Image(systemName: "house.fill")
                
            }
            .tag(0)
            
            NavigationStack(path: $searchPath) {
                SearchView()
                    .navigationDestination(for: Route.self) { route in
                        viewFactory(for: route)
                    }
            }
            .tabItem {
                Text("Search")
                Image(systemName: "magnifyingglass")
            }
            .tag(1)
            
            NavigationStack(path: $analysisPath) {
                AnalysisView()
                    .navigationDestination(for: Route.self) { route in
                        viewFactory(for: route)
                    }
            }
            .tabItem {
                Text("Analysis")
                Image(systemName: "chart.pie")
            }
            .tag(2)
        }
        .tint(Color(uiColor: Colors.secondary500))
        .sheet(item: $activeSheet) { item in
            sheetFactory(for: item)
        }
    }
    
    @ViewBuilder
    func viewFactory(for route: Route) -> some View {
        switch route {
        case .notifications:
            NotificationView()
        case .search:
            SearchView()
        case .home:
            EmptyView()
        case .analysis:
            AnalysisView()
        }
    }
    @ViewBuilder
    func sheetFactory(for item: Sheet) -> some View {
        switch item {
        case .create:
            NavigationStack {
                CreateView()
            }
        }
    }
}
