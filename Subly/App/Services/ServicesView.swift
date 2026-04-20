//
//  ServicesView.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 5.04.2026.
//

import SwiftUI

struct ServicesView: View {
    @Binding var path: NavigationPath
    @StateObject private var viewModel = ServicesViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 6) {
                Text("Popular Plans")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(.gray.opacity(0.8))
                    .padding(.leading, 4)
                
                ForEach(viewModel.filteredServices) { service in
                    HStack(spacing: 15) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color(uiColor: Colors.secondary500).opacity(0.15))
                                .frame(width: 52, height: 52)
                            
                            AsyncImage(url: URL(string: service.pathURL ?? "")) { phase in
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
                        }
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(service.name ?? "Unknown Plan")
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundStyle(.white)
                            
                            Text(service.category ?? "General")
                                .font(.system(size: 13))
                                .foregroundStyle(Color(uiColor: Colors.secondary500).opacity(0.8))
                        }
                        
                        Spacer()
                        
                        Button {
                            guard let id = service.id else {
                                print("ServicesView Error: services not found")
                                    return
                            }
                            path.append(ServiceRoute.create(serviceID: id))
                        } label: {
                            Image(systemName: "chevron.right")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundStyle(.white)
                                .frame(width: 36, height: 36)
                                .background(Circle().fill(Color.white.opacity(0.1)))
                                .overlay(Circle().stroke(Color.white.opacity(0.2), lineWidth: 0.5))
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
        }
        .padding(.horizontal)
        .searchable(text: $viewModel.searchText, prompt: "Search Plans")
        .navigationTitle("Search")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    path.append(ServiceRoute.create(serviceID: ""))
                    
                } label: {
                    Text("Manuel Add")
                        .foregroundStyle(Color(uiColor: Colors.secondary500))
                }
            }
        }
        .onAppear{
            viewModel.getJson()
        }
        
    }
}

#Preview {
    ServicesView(path: .constant(NavigationPath()))
}
