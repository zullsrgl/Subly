//
//  HomeViewModel.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 10.04.2026.
//

import SwiftData
import Combine
import SwiftUI

final class HomeViewModel: ObservableObject {
   
    func getServices(context: ModelContext) {
        let descriptor = FetchDescriptor<ServicesModel>()
        do {
            let data = try context.fetch(descriptor)
        }catch {
            print("HomeViewModel Error: data didn't get")
        }
    }
}

