//
//  ServicesViewModel.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 18.04.2026.
//

import Combine
import SwiftUI

final class ServicesViewModel: ObservableObject {
    @Published var defaultServices: [DefaultServices] = []
    @Published var searchText: String = ""
    
    var filteredServices: [DefaultServices] {
        if searchText.isEmpty {
            return defaultServices
        } else {
            return defaultServices.filter { service in
                let nameMatch = service.name?.localizedCaseInsensitiveContains(searchText) ?? false
                let categoryMatch = service.category?.localizedCaseInsensitiveContains(searchText) ?? false
                return nameMatch || categoryMatch
            }
        }
    }
    
    func getJson() {
        self.defaultServices = ServicesManager.shared.loadJSON()
    }
    
}
