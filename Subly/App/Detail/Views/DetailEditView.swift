//
//  DetailEditView.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 24.04.2026.
//

import SwiftUI
struct DetailEditView: View {
    var services: [ServicesModel]
    var onClicked: (ServicesModel) -> Void
    
    var body: some View {
        List {
            ForEach(services) { service in
                HStack(spacing: 16) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(uiColor: Colors.gray500).opacity(0.2))
                            .frame(width: 45, height: 45)
                        
                        if let path = service.pathURL, let url = URL(string: path) {
                            AsyncImage(url: url) { phase in
                                switch phase {
                                case .success(let image):
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 32, height: 32)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                case .failure(_), .empty:
                                    Image(systemName: "app.badge.fill").foregroundStyle(.gray)
                                @unknown default:
                                    EmptyView()
                                }
                            }
                            .id(service.id)
                        } else {
                            Image(systemName: "app.badge.fill").foregroundStyle(.gray)
                        }
                    }
                    
                    Text(service.name ?? "?")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Text("\(String(format: "%.2f", service.price ?? 0.0)) \(service.current ?? "$")")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.white)
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
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
                .swipeActions {
                    Button(role: .cancel) {
                        onClicked(service)
                    } label: {
                        Label("Delete", systemImage: "trash")
                            .tint(Color.red)
                    }
                
                }
            }
        }
        .listStyle(.plain)
        .frame(minHeight: CGFloat(services.count * 85))
    }
}
#Preview {
    DetailEditView(services: [], onClicked: {_ in })
}
