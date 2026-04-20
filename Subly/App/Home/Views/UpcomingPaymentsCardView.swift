//
//  UpcomingPaymentsCard.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 29.03.2026.
//

import SwiftUI

struct UpcomingPaymentsCardView: View {
    var services: [ServicesModel]
    var body: some View {
        VStack {
            ForEach(services.filter { $0.daysLeft <= 7 }) { service in
                HStack(spacing: 16) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(uiColor: Colors.gray500).opacity(0.2))
                            .frame(width: 45, height: 45)
                        
                        if let path = service.pathURL, let url = URL(string: path) {
                            AsyncImage(url: url) { phase in
                                switch phase {
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 32, height: 32)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                case .failure(_):
                                    Image(systemName: "app.badge.fill")
                                        .foregroundStyle(.gray)
                                case .empty:
                                    ProgressView()
                                        .scaleEffect(0.8)
                                @unknown default:
                                    EmptyView()
                                }
                            }
                            .id(service.id)
                        } else {
                            Image(systemName: "app.badge.fill")
                                .foregroundStyle(.gray)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(service.name ?? "?")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.white)
                        
                        Text(service.nextPaymentDate.formatted(date: .abbreviated, time: .omitted))
                            .font(.system(size: 14))
                            .foregroundStyle(Color(uiColor: Colors.secondary500))
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing, spacing: 4) {
                        Text("\(String(format: "%.2f", service.price ?? 0.0)) \(service.current ?? "$")")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.white)
                        HStack{
                            Circle()
                                .fill(Color(Colors.primary500))
                                .frame(width: 5, height: 5)
                            
                            Text(service.daysLeft == 0 ? "Today" : "\(service.daysLeft) days left")
                                .font(.system(size: 14))
                                .foregroundStyle(service.daysLeft == 0 ? .orange : Color(uiColor: Colors.secondary500))
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
                .padding(.horizontal, 8)
            }
        }
        
    }
}

#Preview {
    UpcomingPaymentsCardView(services: [])
}
