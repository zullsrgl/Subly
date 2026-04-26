//
//  DetailCardView.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 24.04.2026.
//

import SwiftUI

struct DetailCardView: View {
    let services: [ServicesModel]
    
    var body: some View {
        
        let totalAmount = services.reduce(0) { $0 + ($1.price ?? 0) }
        ForEach(services){service in
            VStack(alignment: .leading, spacing: 16) {
                
                let price = service.price ?? 0
                let ratio = totalAmount > 0 ? (price / totalAmount) : 0
                HStack {
                    Text(service.name ?? "-")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                    
                    Spacer()
                    HStack(spacing: 0){
                        Text("\(service.current ?? "$")")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                        Text("\(String(format: "%.2f", service.price ?? 0.0))")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                    }
                }
                
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(white: 0.15))
                            .frame(height: 12)
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(hex: service.color ?? ""))
                            .frame(width: geo.size.width * ratio, height: 12)
                    }
                }
            }
        }
        .padding(.all, 12)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.04))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.white.opacity(0.08), lineWidth: 1)
        )
    }
}

#Preview {
    DetailCardView(services: [])
}
