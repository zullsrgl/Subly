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
    private init() {}
    
    func saveNewServices(services: ServicesModel, context: ModelContext){
        context.insert(services)
        do {
            try context.save()
            print("new services saved success")
        }catch {
            print("Error: Servis Manager services model not saved")
        }
        
    }
}
