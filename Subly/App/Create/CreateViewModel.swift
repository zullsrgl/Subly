//
//  CreateViewModel.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 8.04.2026.
//
import SwiftUI
import Combine
import SwiftData

final class CreateViewModel: ObservableObject{
    @Published var activeAlert: AppAlert?
    @Published var servicesName: String = ""
    @Published var servicesPayment: String = ""
    @Published var selectedCurrency: String = ""
    @Published var selectedCycle: String = ""
    @Published var nextPaymentDate: Date = Date()
    @Published var isReminderEnabled: Bool = false
    
    private func saveNewServices(context: ModelContext){
        let priceValue = Double(servicesPayment) ?? 0.0
        let newServices = ServicesModel(
            id: UUID(),
            name: servicesName,
            path: "",
            price: priceValue,
            current: selectedCurrency,
            priceCycle: selectedCycle,
            date: nextPaymentDate,
            isReminderEnabled: isReminderEnabled)
        
        ServicesManager.shared.saveNewServices(services: newServices, context: context)
    }
    
    func validateAndSave(context: ModelContext) -> Bool {
        if servicesName.isEmpty {
            activeAlert = .error(message: "Plase enter the services name")
            return false
        }
        
        if servicesPayment.isEmpty {
            activeAlert = .error(message: "Please enter the payment amount.")
            return false
        }
        
        if selectedCurrency.isEmpty {
            activeAlert = .error(message: "Please select a currency.")
            return false
        }
        
        if selectedCycle.isEmpty {
            activeAlert = .error(message: "Please select a payment period.")
            return false
        }
        saveNewServices(context: context)
        return true
    }
}

