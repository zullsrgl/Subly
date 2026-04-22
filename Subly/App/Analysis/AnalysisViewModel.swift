//
//  AnalysisViewModel.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 21.04.2026.
//

import Combine

final class AnalysisViewModel: ObservableObject {
    @Published var categories: [String] = []
    
    func getAllCatecories() {
       categories = ServicesManager.shared.getCategories()
    }
}
