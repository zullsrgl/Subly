//
//  AppsCategoriesView.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 1.04.2026.
//

import SwiftUI

struct SubsCategoriesView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Categories")
                .font(.system(size: 13, weight: .bold))
                .foregroundStyle(.gray.opacity(0.7))
                .padding(.leading, 4)
            
            ForEach(0..<4, id: \.self) { index in
                HStack(spacing: 16) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(uiColor: Colors.secondary500).opacity(0.12))
                            .frame(width: 48, height: 48)
                        
                        Image(systemName: "music.note")
                            .font(.system(size: 20))
                            .foregroundStyle(Color(uiColor: Colors.secondary500))
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Music")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(.white)
                        
                        HStack(spacing: 6) {
                            Text("4 Services")
                            Circle()
                                .frame(width: 3, height: 3)
                            Text("10%")
                        }
                        .font(.system(size: 12, weight: .medium))
                        .foregroundStyle(.gray)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing, spacing: 4) {
                        Text("$4.54")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundStyle(.white)
                        
                        Text("Active")
                            .font(.system(size: 11, weight: .bold))
                            .padding(.horizontal, 8)
                            .padding(.vertical, 2)
                            .background(Capsule().fill(Color.green.opacity(0.15)))
                            .foregroundStyle(.green)
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
}
#Preview {
    SubsCategoriesView()
}
