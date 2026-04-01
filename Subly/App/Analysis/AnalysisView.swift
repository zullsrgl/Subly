//
//  AnalysisView.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 1.04.2026.
//

import SwiftUI


struct AnalysisView: View {
    var body: some View {
        ScrollView{
            VStack {
                ChartView()
                SubsCategoriesView()
            }
            .padding(.horizontal)
        }
        .navigationTitle("Portfolio")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AnalysisView()
}
