//
//  NotificationView.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 31.03.2026.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        List {
            ForEach(0..<5) { _ in
                NotificationCard()
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(role: .destructive) {
                            //TODO: Delete Notification
                        } label: {
                            Text("Delete")
                            Image(systemName: "trash.fill")
                               
                        }
                        .tint(.red)
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color(Colors.black))
                    .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(Color.black)
        
    }
}

#Preview {
    NotificationView()
}
