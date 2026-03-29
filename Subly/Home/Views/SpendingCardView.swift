//
//  SpendingCardView.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 29.03.2026.
//

import SwiftUI

struct SpendingCardView: View {
    var body: some View {
        VStack{
            Text("TOTAL MONTHLY SPENDING")
                .font(.system(size: 16, weight: .semibold))
                .tracking(4)
                .foregroundStyle(Color(Colors.secondary500))
                .padding(.top, 12)
            
            HStack(alignment: .firstTextBaseline) {
                Text("$")
                    .font(.system(size: 24,weight: .semibold))
                    .foregroundStyle(Color(Colors.secondary500))
                
                Text("324.00")
                    .font(.system(size: 64, weight: .semibold))
                    .foregroundStyle(Color(Colors.white))
            }
        }
    }
}
#Preview {
    SpendingCardView()
}
