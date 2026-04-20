//
//  IdentityView.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 31.03.2026.
//

import SwiftUI

struct IdentityView: View {
    @Binding var servicesName: String
    
    @Binding var selectedServiceName: String?
    @Binding var selectedServicePath: String?
    
    var body: some View {
        VStack(alignment: .leading){
            Text("IDENTITY")
                .foregroundStyle(Color(Colors.gray600))
                .font(.system(size: 16, weight: .semibold))
            
            HStack{
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(uiColor: Colors.gray500).opacity(0.2))
                        .frame(width: 45, height: 45)
                    
                    if let path = selectedServicePath, !path.isEmpty, let url = URL(string: path) {
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
                                ProgressView() // Yüklenirken
                                    .scaleEffect(0.8)
                            @unknown default:
                                EmptyView()
                            }
                        }
                        .id(path)
                    } else {
                        Image(systemName: "app.badge.fill")
                            .foregroundStyle(.gray)
                            .frame(width: 32, height: 32)
                    }
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    
                    TextField("", text: $servicesName, prompt:
                        Text("Enter the Service Name")
                            .foregroundStyle(Color(Colors.gray300))
                            .font(.system(size: 16, weight: .semibold))
                    )
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(Color(Colors.white))
                    
                    Divider()
                        .background(Color(uiColor: Colors.gray400).opacity(0.3))
                        .padding(.horizontal)
                        .frame(height: 3)
                }
                Spacer()
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

#Preview {
    IdentityView(servicesName: .constant(""), selectedServiceName: .constant(""), selectedServicePath: .constant(""))
}
