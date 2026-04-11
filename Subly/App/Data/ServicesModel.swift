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
    var pathURL: String?
    var price: Double?
    var current: String?
    var priceCycle: String?
    var date: Date?
    var isReminderEnabled: Bool?
    
    init(id: UUID, name: String? = nil, path: String? = nil, price: Double? = nil, current: String? = nil, priceCycle: String? = nil, date: Date? = nil, isReminderEnabled: Bool? = nil) {
        self.id = id
        self.name = name
        self.pathURL = path
        self.price = price
        self.current = current
        self.priceCycle = priceCycle
        self.date = date
        self.isReminderEnabled = isReminderEnabled
    }
    
}
