//
//  ContentView.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 29.03.2026.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Binding var activeSheet: Sheet?
    @Binding var path: NavigationPath
    @StateObject private var viewModel = HomeViewModel()
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \ServicesModel.name) var services: [ServicesModel]
    
    let columns = [
        GridItem(.flexible(), spacing: 24),
        GridItem(.flexible(), spacing: 24)
    ]
    
    var dueSoonCount: Int {
        services.filter { $0.daysLeft <= 7 }.count
    }
    
    var body: some View {
        ScrollView {
            SpendingCardView(services: services)
            LazyVGrid(columns: columns) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Active Plans")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundStyle(Color(Colors.gray800))
                    
                    Text("\(services.count)")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundStyle(Color(Colors.white))
                }
                .padding()
                .frame(maxWidth: .infinity, minHeight: 100, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.white.opacity(0.04))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.white.opacity(0.08), lineWidth: 1)
                )
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Due Soon")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundStyle(Color(Colors.gray800))
                    
                    Text("\(dueSoonCount)")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundStyle(Color(Colors.secondary500))
                }
                .padding()
                .frame(maxWidth: .infinity, minHeight: 100, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.white.opacity(0.04))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.white.opacity(0.08), lineWidth: 1)
                )
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 20)
            
            OptimizeCardView(onClicedBottomSheet: {
                activeSheet = .services
                
            })
            .padding(.bottom, 20)
            
            if !services.isEmpty {
                Text("Upcoming Payments")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(.gray.opacity(0.8))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 8)
            }
            
            UpcomingPaymentsCardView(services: services)
                .padding(.bottom, 20)
            
        }
        .background(
            Color(Colors.black)
        )
        .navigationTitle("Potfolio")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    path.append(Route.notifications)
                } label: {
                    Image(systemName: "bell.fill")
                        .resizable()
                        .padding(.all, 2)
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(Color(uiColor: Colors.secondary500))
                }
            }
        }
    }
}

#Preview {
    HomeView(activeSheet: .constant(nil), path: .constant(NavigationPath()))
}
