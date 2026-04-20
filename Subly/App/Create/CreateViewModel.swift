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
    
    @Published var selectedServiceName: String?
    @Published var selectedServicepath: String?
    
    private func saveNewServices(context: ModelContext){
        let cleanedPayment = servicesPayment.replacingOccurrences(of: ",", with: ".")
        let priceValue = Double(cleanedPayment) ?? 0.0
        
        let newServices = ServicesModel(
            id: UUID(),
            name: servicesName,
            path: selectedServicepath ?? "",
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
    
    func getSelectedService(serviceID: String) {
        guard !serviceID.isEmpty else { return }
        
        if let service = ServicesManager.shared.defaultServices.first(where: { $0.id == serviceID }) {
            let name = service.name ?? ""
            self.selectedServicepath = service.pathURL ?? ""
            self.selectedServiceName = name
            self.servicesName = name
        }
    }
}

