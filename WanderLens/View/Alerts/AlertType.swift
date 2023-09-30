//
//  AlertType.swift
//  WanderLens
//
//  Created by Telem Tobi on 30/09/2023.
//

import Foundation
import AlertToast

enum AlertType {
    
    case photoSaveSucceeded
    case photoSaveFailed
}

extension AlertType {
    
    var displayMode: AlertToast.DisplayMode {
        switch self {
        case .photoSaveSucceeded: return .alert
        case .photoSaveFailed: return .alert
        }
    }
    
    var type: AlertToast.AlertType {
        switch self {
        case .photoSaveSucceeded: return .complete(.accentColor)
        case .photoSaveFailed: return .error(.red)
        }
    }
    
    var title: String {
        switch self {
        case .photoSaveSucceeded: return "Successfully Saved"
        case .photoSaveFailed: return "Something Went Wrong"
        }
    }
    
    var subtitle: String? {
        switch self {
        case .photoSaveSucceeded: return nil
        case .photoSaveFailed: return nil
        }
    }
    
    var duration: Double? {
        switch self {
        case .photoSaveSucceeded: return nil
        case .photoSaveFailed: return nil
        }
    }
}
