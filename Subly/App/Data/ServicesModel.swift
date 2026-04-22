//
//  ServicesModel.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 6.04.2026.
//
import SwiftData
import Combine
import Foundation

@Model
class ServicesModel {
    var id: UUID
    var name: String?
    var category: String?
    var pathURL: String?
    var price: Double?
    var current: String?
    var priceCycle: String?
    var date: Date?
    var isReminderEnabled: Bool?
    var color: String?
    
    init(id: UUID, name: String? = nil, category: String? = nil, path: String? = nil, price: Double? = nil, current: String? = nil, priceCycle: String? = nil, date: Date? = nil, isReminderEnabled: Bool? = nil, color: String? = nil) {
        self.id = id
        self.name = name
        self.category = category 
        self.pathURL = path
        self.price = price
        self.current = current
        self.priceCycle = priceCycle
        self.date = date
        self.isReminderEnabled = isReminderEnabled
        self.color = color
    }
    
}


extension ServicesModel {
    var nextPaymentDate: Date {
        guard let startDate = self.date else { return Date() }
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        var nextDate = calendar.startOfDay(for: startDate)
        
        while nextDate < today {
            if let updatedDate = calendar.date(byAdding: .month, value: 1, to: nextDate) {
                nextDate = updatedDate
            } else { break }
        }
        return nextDate
    }
    
    var daysLeft: Int {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let target = calendar.startOfDay(for: self.nextPaymentDate)
        
        return calendar.dateComponents([.day], from: today, to: target).day ?? 0
    }
}

struct DefaultServices: Decodable, Identifiable {
    var id: String?
    var name: String?
    var category: String?
    var pathURL: String?
    var color: String?
}


struct ServiceResponse: Decodable {
    let services: [DefaultServices]
}
