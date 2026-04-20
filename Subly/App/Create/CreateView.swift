//
//  CreateView.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 30.03.2026.
//

import SwiftUI

struct CreateView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext
    @StateObject private var viewModel = CreateViewModel()
    @State var serviceID: String?
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 40){
                IdentityView(servicesName: $viewModel.servicesName,
                             selectedServiceName: $viewModel.selectedServiceName,
                             selectedServicePath: $viewModel.selectedServicepath)
                
                PlanDetailView(servicesPayment: $viewModel.servicesPayment, selectedCurrency: $viewModel.selectedCurrency, selectedCycle: $viewModel.selectedCycle)
                TimelineView(nextPaymentDate: $viewModel.nextPaymentDate)
                AlertView(isReminderEnabled: $viewModel.isReminderEnabled)
            }
            .padding(.horizontal)
            .scrollDismissesKeyboard(.interactively)
            .navigationTitle("New Plans")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        if viewModel.validateAndSave(context: modelContext) {
                            dismiss()
                        }
                    }
                    
                    .foregroundStyle(Color(uiColor: Colors.secondary500))
                    .fontWeight(.bold)
                }
            }
        }
        .alert(item: $viewModel.activeAlert) { type in
            AlertFactory.build(for: type)
        }
        .onAppear{
            guard let id = serviceID, !id.isEmpty else { return }
            viewModel.getSelectedService(serviceID: id)
        }
    }
}

#Preview {
    CreateView()
}
