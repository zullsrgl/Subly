//
//  AlertFactory.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 15.04.2026.
//

import SwiftUI

enum AppAlert: Identifiable {
    case success(message: String)
    case error(message: String)
    case networkIssue
    
    var id: String {
        switch self {
        case .success(let msg): return "success-\(msg)"
        case .error(let msg): return "error-\(msg)"
        case .networkIssue: return "network"
        }
    }
    
    var title: String {
        switch self {
        case .success: return "Success"
        case .error: return "Error"
        case .networkIssue: return "Network Error"
        }
    }
    
    var message: String {
        switch self {
        case .success(let msg):
            return msg
        case .error(let msg):
            return msg
        case .networkIssue:
            return "Please check your internet connection."
        }
    }
}

class AlertFactory {
    static func build(for type: AppAlert, primaryAction: (() -> Void)? = nil) -> Alert {
        let dismissButton: Alert.Button = .default(Text("Ok")) {
            primaryAction?()
        }
        
        return Alert(
            title: Text(type.title),
            message: Text(type.message),
            dismissButton: dismissButton
        )
    }
}
