//
//  NotificationCard.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 31.03.2026.
//

import SwiftUI

struct NotificationCard: View {
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(uiColor: Colors.gray500).opacity(0.2))
                    .frame(width: 45, height: 45)
                
                Image(systemName: "bell.fill")
                    .font(.system(size: 20))
                    .foregroundStyle(Color(uiColor: Colors.secondary500))
            }
            
            VStack(alignment: .leading){
                Text("App payments is due")
                    .foregroundStyle(Color(Colors.white))
                    .font(.system(size: 16, weight: .semibold))
                
                Text("$12,43")
                    .foregroundStyle(Color(Colors.secondary700))
                    .font(.system(size: 16, weight: .bold))
            }
            Spacer()
            VStack(alignment: .leading){
                Text("24 Oct")
                    .foregroundStyle(Color(Colors.gray500))
                    .font(.system(size: 16, weight: .semibold))
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
    NotificationCard()
}
