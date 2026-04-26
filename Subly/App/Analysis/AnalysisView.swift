//
//  AnalysisView.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 1.04.2026.
//

import SwiftUI
import SwiftData

struct AnalysisView: View {
    @Namespace private var animation
    @StateObject private var viewModel = AnalysisViewModel()
    @State private var selectedPeriod: String = "Monthly"
    @Query(sort: \ServicesModel.name) var services: [ServicesModel]
    @Binding var path: NavigationPath
    
    let periods = ["Weekly", "Monthly", "Yearly"]
    let categoryIcons: [String: String] = ["Stream": "play.tv.fill", "Music": "music.note","Shopping": "cart.fill","Design": "paintpalette.fill",  "AI": "sparkles", "Education": "graduationcap.fill","Gaming": "gamecontroller.fill","Social": "person.2.fill",  "Productivity": "checklist", "Health": "heart.fill", "Food": "fork.knife","Privacy": "shield.lefthalf.filled", "Business": "briefcase.fill", "Development": "terminal.fill", "News": "newspaper.fill",  "Services": "square.stack.3d.up.fill"]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                let sortedCategories = viewModel.categories.sorted { cat1, cat2 in
                    let count1 = services.filter { $0.category == cat1 }.count
                    let count2 = services.filter { $0.category == cat2 }.count
                    return count1 > count2
                }
                
                ForEach(sortedCategories, id: \.self) { category in
                    let filtered = services.filter { $0.category == category }
                    let count = filtered.count
                    let total = services.count
                    let percentage = total > 0 ? (Double(count) / Double(total) * 100) : 0
                    let hexColor = filtered.first?.color ?? "#3A3A3C"
                    
                    AnalysisCategorieView(
                        name: category,
                        icon: categoryIcons[category] ?? "square.grid.2x2.fill",
                        count: count,
                        percentage: percentage,
                        color: Color(hex: hexColor)
                    )
                    .onTapGesture {
                        path.append(Route.detail(categoryName: category))
                    }
                }
            }
            .padding(.horizontal)
            
        }
        .navigationTitle("Portfolio")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear{
            viewModel.getAllCatecories()
        }
    }
}

#Preview {
    AnalysisView(path: .constant(NavigationPath()))
}
