//
//  TimelineView.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 31.03.2026.
//

import SwiftUI

struct TimelineView: View {
    @State private var nextPaymentDate = Date()
    @State private var isPickerExpanded = false
    
    var body: some View {
        VStack(alignment: .leading){
            Text("TIME LINE")
                .foregroundStyle(Color(Colors.gray600))
                .font(.system(size: 16, weight: .semibold))
            
            VStack{
                HStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(uiColor: Colors.gray500).opacity(0.2))
                            .frame(width: 45, height: 45)
                        
                        Image(systemName: "calendar")
                            .resizable()
                            .foregroundStyle(Color(Colors.secondary500))
                            .frame(width: 20, height: 16)
                    }
                    VStack(alignment: .leading) {
                        Text("Next Payment")
                            .font(.system(size: 12))
                            .foregroundStyle(Color(Colors.gray800))
                        Text(nextPaymentDate.formatted(date: .abbreviated, time: .omitted))
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(.white)
                    }
                    
                    Spacer()
                    
                    Button {
                        withAnimation(.spring()) { isPickerExpanded.toggle() }
                    } label: {
                        Image(systemName: isPickerExpanded ? "chevron.up" : "calendar.badge.plus")
                            .foregroundStyle(Color(uiColor: Colors.secondary500))
                    }
                }
                if isPickerExpanded {
                    Divider()
                        .padding(.horizontal)
                    DatePicker("", selection: $nextPaymentDate,
                               in: Date()...,
                               displayedComponents: .date)
                    .datePickerStyle(.graphical)
                    .tint(Color(uiColor: Colors.secondary500))
                    .padding()
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

#Preview {
    TimelineView()
}
