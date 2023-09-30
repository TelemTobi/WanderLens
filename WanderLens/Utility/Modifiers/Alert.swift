//
//  Alert.swift
//  WanderLens
//
//  Created by Telem Tobi on 30/09/2023.
//

import SwiftUI
import AlertToast

fileprivate struct AlertModifier: ViewModifier {

    @Binding var alertType: AlertType?
    @State private var isPresented: Bool = false
    
    func body(content: Content) -> some View {
        content
            .toast(
                isPresenting: $isPresented,
                duration: alertType?.duration ?? 2.0,
                alert: {
                    AlertToast(
                        displayMode: alertType?.displayMode ?? .alert,
                        type: alertType?.type ?? .regular,
                        title: alertType?.title,
                        subTitle: alertType?.subtitle
                    )
                },
                completion: { alertType = nil }
            )
            .onChange(of: alertType) {
                guard alertType != nil else { return }
                isPresented = true
            }
    }
}

extension View {
    
    func alert(type: Binding<AlertType?>) -> some View {
        modifier(AlertModifier(alertType: type))
    }
}
