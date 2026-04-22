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
    
    let periods = ["Weekly", "Monthly", "Yearly"]
    let categoryIcons: [String: String] = ["Stream": "play.tv.fill", "Music": "music.note","Shopping": "cart.fill","Design": "paintpalette.fill",  "AI": "sparkles", "Education": "graduationcap.fill","Gaming": "gamecontroller.fill","Social": "person.2.fill",  "Productivity": "checklist", "Health": "heart.fill", "Food": "fork.knife","Privacy": "shield.lefthalf.filled", "Business": "briefcase.fill", "Development": "terminal.fill", "News": "newspaper.fill",  "Services": "square.stack.3d.up.fill"]
    
    var body: some View {
        ScrollView{
            ScrollView {
                VStack(spacing: 20) {
                    HStack {
                        ForEach(periods, id: \.self) { period in
                            Button {
                                withAnimation(.spring(response: 0.4, dampingFraction: 0.75)) {
                                    selectedPeriod = period
                                }
                            } label: {
                                Text(period)
                                    .font(.system(size: 13, weight: .bold))
                                    .foregroundStyle(selectedPeriod == period ? .white : .gray)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 10)
                                    .background(
                                        ZStack {
                                            if selectedPeriod == period {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .fill(Color.white.opacity(0.1))
                                                    .matchedGeometryEffect(id: "bg", in: animation)
                                            }
                                        }
                                    )
                            }
                        }
                    }
                    .padding(4)
                    .background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.05)))
                    .padding(.horizontal)
                    
                    VStack(spacing: 12) {
                        ForEach(viewModel.categories, id: \.self) { category in
                            AnalysisCategorieView(
                                name: category,
                                icon: categoryIcons[category] ?? "square.grid.2x2.fill",
                                count: 9,
                                percentage: 25,
                                color: .orange
                            )
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical)
            }
        }
        .navigationTitle("Portfolio")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear{
            viewModel.getAllCatecories()
        }
    }
}

#Preview {
    AnalysisView()
}
