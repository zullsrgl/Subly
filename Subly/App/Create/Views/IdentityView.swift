//
//  IdentityView.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 31.03.2026.
//

import SwiftUI

struct IdentityView: View {
    @State private var subscriptionName: String = ""
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
                    
                    Image(systemName: "movieclapper.fill")
                        .font(.system(size: 20))
                        .foregroundStyle(Color(uiColor: Colors.secondary500))
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    TextField("", text: $subscriptionName, prompt:
                                Text("Name your subscription")
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
    IdentityView()
}
