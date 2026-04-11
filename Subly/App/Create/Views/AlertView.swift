//
//  AlertView.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 31.03.2026.
//

import SwiftUI

struct AlertView: View {
    @Binding var isReminderEnabled: Bool
    
    var body: some View {
        VStack(alignment: .leading){
            Text("ALERTS")
                .foregroundStyle(Color(Colors.gray600))
                .font(.system(size: 16, weight: .semibold))
            
            HStack{
                Image(systemName: "bell.fill")
                    .resizable()
                    .foregroundStyle(Color(Colors.secondary500))
                    .frame(width: 20, height: 20)
                VStack(alignment: .leading){
                    Text("Reminde Me")
                        .foregroundStyle(Color(Colors.white))
                        .font(.system(size: 16, weight: .semibold))
                    
                    Text("Get notified before payment")
                        .foregroundStyle(Color(Colors.white))
                        .font(.system(size: 16, weight: .regular))
                }
                Spacer()
                
                Toggle("", isOn: $isReminderEnabled)
                    .labelsHidden()
                    .tint(Color(uiColor: Colors.secondary500))
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
    AlertView(isReminderEnabled: .constant(true))
}
