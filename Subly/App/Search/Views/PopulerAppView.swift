//
//  PopulerAppView.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 31.03.2026.
//

import SwiftUI

struct PopulerAppView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Popular Applications")
                .font(.system(size: 14, weight: .bold))
                .foregroundStyle(.gray.opacity(0.8))
                .padding(.leading, 4)
            
            ForEach(0..<5, id: \.self){ index in
                HStack(spacing: 15) {
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(uiColor: Colors.secondary500).opacity(0.15))
                            .frame(width: 52, height: 52)
                        
                        Image(systemName: "movieclapper.fill")
                            .font(.system(size: 22))
                            .foregroundStyle(Color(uiColor: Colors.secondary500))
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Netflix")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundStyle(.white)
                        
                        Text("Streaming")
                            .font(.system(size: 13))
                            .foregroundStyle(Color(uiColor: Colors.secondary500).opacity(0.8))
                    }
                    
                    Spacer()
                    
                    Button {
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(.white)
                            .frame(width: 36, height: 36)
                            .background(Circle().fill(Color.white.opacity(0.1)))
                            .overlay(Circle().stroke(Color.white.opacity(0.2), lineWidth: 0.5))
                    }
                }
                .padding(.all, 12)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(uiColor: Colors.gray800).opacity(0.3))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white.opacity(0.1), lineWidth: 1)
                )
            }
        }
    }
}

#Preview {
    PopulerAppView()
}
