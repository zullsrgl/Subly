//
//   CategoryView.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 31.03.2026.
//

import SwiftUI

struct CategoryView: View {
    let categories = [  "All","Streaming","Music","Gaming","Productivity","Finance","Health","Education","Shopping","Utilities", "News"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 12){
                ForEach(categories, id: \.self){ categori in
                    Text(categori)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(Color(Colors.white))
                        .frame(height: 40)
                        .padding(.horizontal, 16)
                        .background(RoundedRectangle(cornerRadius: 20)
                            .fill(Color(Colors.tertiary500)))
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(Colors.tertiary500), lineWidth: 1))
                }
            }
        } 
    }
}

#Preview {
    CategoryView()
}
