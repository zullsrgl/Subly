//
//  DetailView.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 22.04.2026.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    let categoryName: String
    @Query var services: [ServicesModel]
    @Environment(\.modelContext) private var modelContext
    
    var totalTLAmount: Double {
        services.filter { $0.category == categoryName }
            .reduce(0) { total, service in
                let price = service.price ?? 0.0
                switch service.current {
                case "$":
                    return total + (price * 44.75)
                case "€":
                    return total + (price * 52.82)
                default:
                    return total + price
                }
            }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                Text("Monthly Spending")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(Color(Colors.gray500))
                HStack(alignment: .firstTextBaseline ,spacing: 0){
                    Text("₺")
                        .font(.system(size: 32, weight: .semibold))
                        .foregroundStyle(Color(Colors.white))
                    
                    Text(String(format: "%.2f", totalTLAmount))
                        .font(.system(size: 64, weight: .semibold))
                        .foregroundStyle(Color(Colors.white))
                }
                
                
                let filtered = services.filter { $0.category == categoryName }
                DetailCardView(services: filtered)
                
                    .padding(.bottom, 32)
                
                Text("Active Services")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(Color(Colors.gray500))
               
                DetailEditView(services: filtered,
                               onClicked: { service in
                    modelContext.delete(service)
                })
            }
        }
    }
}
#Preview {
    DetailView(categoryName: "")
}

