//
//  CreateView.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 30.03.2026.
//

import SwiftUI

struct CreateView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 40){
                IdentityView()
                PlanDetailView()
                TimelineView()
                AlertView()
            }
            .padding(.horizontal)
            .scrollDismissesKeyboard(.interactively)
            .navigationTitle("New Plans")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .foregroundStyle(Color(uiColor: Colors.secondary500))
                    .fontWeight(.bold)
                }
            }
        }
    }
}

#Preview {
    CreateView()
}
