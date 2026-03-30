//
//  CreateView.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 30.03.2026.
//

import SwiftUI

struct CreateView: View {
    @Environment(\.dismiss) var dismiss
    @State private var remindMe: Bool = true
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 40){
                IdentityView()
                PlanDetailView()
                TimelineView()
                
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
                    
                    Toggle("", isOn: $remindMe)
                        .labelsHidden()
                        .tint(Color(uiColor: Colors.secondary500))
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(Colors.gray200))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color(uiColor: Colors.gray300).opacity(0.5), lineWidth: 1)
                )
            }
            .padding(.horizontal)
        }
        .background(Color.black.ignoresSafeArea())
        .scrollDismissesKeyboard(.interactively)
        .navigationTitle("New Subscription")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Done") {
                    dismiss()
                }
                .foregroundStyle(Color(uiColor: Colors.secondary500))
                .fontWeight(.bold)
            }
            
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(.gray)
                }
            }
        }
    }
}

#Preview {
    CreateView()
}
