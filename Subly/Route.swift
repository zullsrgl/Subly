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
    case analysis
    case detail(categoryName: String)
}

enum ServiceRoute: Hashable {
    case create(serviceID: String)
}

enum Sheet: Identifiable {
    case services
    var id: String { String(describing: self) }
}

struct MainTabView: View {
    @State private var homePath = NavigationPath()
    @State private var searchPath = NavigationPath()
    @State private var analysisPath = NavigationPath()
    @State private var createPath = NavigationPath()
    
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
            
            NavigationStack(path: $analysisPath) {
                AnalysisView( path: $analysisPath)
                    .navigationDestination(for: Route.self) { route in
                        viewFactory(for: route)
                    }
            }
            .tabItem {
                Text("Analysis")
                Image(systemName: "chart.pie")
            }
            .tag(1)
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
        case .home:
            EmptyView()
        case .analysis:
            AnalysisView(path: $analysisPath)
        case .detail(let categoryName):
            DetailView(categoryName: categoryName)
        }
    }
    @ViewBuilder
    func sheetFactory(for item: Sheet) -> some View {
        switch item {
        case .services:
            NavigationStack(path: $createPath){
                ServicesView(path: $createPath)
                    .navigationDestination(for: ServiceRoute.self) { route in
                        switch route {
                        case .create(let id):
                            CreateView(serviceID: id)
                        }
                    }
            }
        }
    }
}
