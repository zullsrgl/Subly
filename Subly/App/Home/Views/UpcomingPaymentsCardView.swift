//
//  UpcomingPaymentsCard.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 29.03.2026.
//

import SwiftUI

struct UpcomingPaymentsCardView: View {
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(uiColor: Colors.gray500).opacity(0.2))
                    .frame(width: 45, height: 45)
                
                Image(systemName: "movieclapper.fill")
                    .font(.system(size: 20))
                    .foregroundStyle(Color(uiColor: Colors.secondary500))
            }
            
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Netflix")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.white)
                
                Text("Sep 15")
                    .font(.system(size: 14))
                    .foregroundStyle(Color(uiColor: Colors.secondary500))
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text("$10.49")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.white)
                
                Text("Premium")
                    .font(.system(size: 14))
                    .foregroundStyle(Color(uiColor: Colors.secondary500))
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(uiColor: Colors.gray200))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(uiColor: Colors.gray300).opacity(0.5), lineWidth: 1)
        )
        .padding(.horizontal, 8) 
    }
}

#Preview {
    UpcomingPaymentsCardView()
}
