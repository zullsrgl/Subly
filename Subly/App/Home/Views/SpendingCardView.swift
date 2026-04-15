//
//  SpendingCardView.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 29.03.2026.
//

import SwiftUI

struct SpendingCardView: View {
    var services: [ServicesModel]
    let currencies = ["₺","$", "€"]
    @State private var currentIndex = 0
    
    var totalSpending: Double {
            services.reduce(0.0) { $0 + ($1.price ?? 0.0) }
        }
    
    private var displayedAmount: Double {
            switch currentIndex {
            case 1:
                return totalSpending / 44.75
            case 2:
                return totalSpending / 52.82
            default:
                return totalSpending
            }
        }
    
    var body: some View {
        VStack{
            Text("TOTAL MONTHLY SPENDING")
                .font(.system(size: 16, weight: .semibold))
                .tracking(4)
                .foregroundStyle(Color(Colors.secondary500))
                .padding(.top, 12)
            
            HStack(alignment: .firstTextBaseline) {
                Text(currencies[currentIndex])
                    .font(.system(size: 24,weight: .semibold))
                    .foregroundStyle(Color(Colors.secondary500))
                    .onTapGesture {
                        currentIndex = (currentIndex + 1) % currencies.count
                    }
                    .animation(.spring(), value: currentIndex)
                
                Text(String(format: "%.2f", displayedAmount))
                    .font(.system(size: 64, weight: .semibold))
                    .foregroundStyle(Color(Colors.white))
            }
        }
    }
}
#Preview {
    SpendingCardView(services: [])
}
