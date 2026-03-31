//
//  ContentView.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 29.03.2026.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab = 0
    @Binding var activeSheet: Sheet?
    @Binding var path: NavigationPath
    
    let columns = [
        GridItem(.flexible(), spacing: 24),
        GridItem(.flexible(), spacing: 24)
    ]
    
    var body: some View {
        ScrollView {
            SpendingCardView()
            LazyVGrid(columns: columns) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Active Plans")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundStyle(Color(Colors.gray800))
                    
                    Text("12")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundStyle(Color(Colors.white))
                }
                .padding()
                .frame(maxWidth: .infinity, minHeight: 100, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(Colors.gray200))
                )
                .overlay {
                    RoundedRectangle(cornerRadius: 12).stroke(Color(Colors.gray300), lineWidth: 1)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Due Soon")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundStyle(Color(Colors.gray800))
                    
                    Text("3")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundStyle(Color(Colors.secondary500))
                }
                .padding()
                .frame(maxWidth: .infinity, minHeight: 100, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(Colors.gray200))
                )
                .overlay {
                    RoundedRectangle(cornerRadius: 12).stroke(Color(Colors.gray300), lineWidth: 1)
                }
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 40)
            
            HStack{
                Text("Upcoming Payments")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(.gray.opacity(0.8))
                    .padding(.leading, 4)

                
                Spacer()
                Button {
                    
                }label: {
                    Text("See All")
                        .foregroundStyle(Color(Colors.secondary500))
                        .font(.system(size: 14, weight: .bold))
                    
                }
            }
            .padding(.horizontal, 8)
            
            UpcomingPaymentsCardView()
                .padding(.bottom, 40)
            
            OptimizeCardView(onClicedBottomSheet: {
                activeSheet = .create
                
            })
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
