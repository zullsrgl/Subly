//
//  ServicesManager.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 9.04.2026.
//


import Foundation
import SwiftData

class ServicesManager{
    static let shared = ServicesManager()
    var defaultServices: [DefaultServices] = []
    var isCategory: [String] = []
    
    
    private init() { }
    
    func saveNewServices(services: ServicesModel, context: ModelContext){
        context.insert(services)
        do {
            try context.save()
            print("new services saved success")
        }catch {
            print("Error: Servis Manager services model not saved")
        }
        
    }
    
    func loadJSON() -> [DefaultServices] {
        guard let url = Bundle.main.url(forResource: "DefaultsServices", withExtension: "json") else {
            print("Not found json file.")
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode(ServiceResponse.self, from: data)
            
            self.defaultServices = decodedData.services
            
            return decodedData.services
            
        } catch {
            print("Parse Error: \(error)")
            return []
        }
    }
    
    
    func getCategories() -> [String] {
        guard let url = Bundle.main.url(forResource: "DefaultsServices", withExtension: "json") else {
            print("Not found json file.")
            return []
        }
        do {
            let data = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode(ServiceResponse.self, from: data)
            let categoryNames = decodedData.services.compactMap { $0.category }
            let uniqueCategories = Array(Set(categoryNames)).sorted()
            return uniqueCategories
            
        } catch {
            print("category filtered error")
            return []
        }
    }
}
