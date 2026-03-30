//
//  OptimizeCardView.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 29.03.2026.
//

import SwiftUI

struct OptimizeCardView: View {
    let onClicedBottomSheet: () -> Void
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            VStack(alignment: .leading, spacing: 12){
                Text("Optimize Your Wealth")
                    .foregroundStyle(Color(Colors.white))
                    .font(.system(.title, weight: .semibold))
                
                Text("Indetify unused subscriptions and save up to $45/mo")
                    .foregroundStyle(Color(Colors.white))
                Spacer()
            }
            .padding(.all, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Button {
                onClicedBottomSheet()
                
            } label: {
                Image(systemName: "plus")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(Color(uiColor: Colors.primary900))
                    .frame(width: 56, height: 56)
                    .background(
                        Circle()
                            .fill(Color(uiColor: Colors.primary300))
                            .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 4)
                    )
            }
            .padding(.trailing, 8)
            .padding(.bottom, 8)
        }
        
        .frame(maxWidth: .infinity)
        .frame(height: 160)
        .background(
            Image("fintech")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 160)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        )
        .padding(.horizontal)
    }
}

#Preview {
    OptimizeCardView(onClicedBottomSheet: {})
}
