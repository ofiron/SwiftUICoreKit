//
//  View+Error.swift
//  SwiftUICoreKit
//
//  Created by Ofir Ron on 23/02/2025.
//

import SwiftUI

extension View {
    /// Applies standardized error message styling to any Text view
    public func errorStyle() -> some View {
        self
            .font(UIStyles.errorFont)
            .foregroundColor(UIStyles.errorColor)
    }
    
    /// Convenience modifier that attaches an error message overlay to any view
    ///
    /// - Parameter message: The error text to display in overlay
    /// - Note: Prefer this over manual ZStack management for error presentation.
    ///         Works best when combined with `ErrorMessageView`.
    ///
    /// # Example
    /// ```swift
    /// struct LoginView: View {
    ///     @State private var errorMessage: String?
    ///
    ///     var body: some View {
    ///         VStack {
    ///             // Login form fields
    ///             Button("Login") {
    ///                 validateCredentials()
    ///             }
    ///         }
    ///         .withErrorAlert(message: errorMessage)
    ///     }
    ///
    ///     private func validateCredentials() {
    ///         errorMessage = "Invalid username or password"
    ///     }
    /// }
    /// ```
    @available(*, deprecated, message: "🛠️ Experimental API - Needs validation before using in production environments")
    public func withErrorAlert(message: String?) -> some View {
        overlay(
            ErrorMessageView(message: message)
        )
    }
}

#if DEBUG
#Preview("Error Style Applied") {
    Text("Critical System Error")
        .errorStyle()
}

#Preview("Default Style Comparison") {
    VStack(spacing: 20) {
        Text("Default Style Text")
        Text("Error Style Text")
            .errorStyle()
    }
}
#endif


#if DEBUG
#Preview("With Error") {
    Text("Main Content")
        .padding()
        .withErrorAlert(message: "Network connection failed")
}

#Preview("Nil Error") {
    Text("Main Content")
        .padding()
        .withErrorAlert(message: nil)
}

#Preview("Empty Error") {
    Text("Main Content")
        .padding()
        .withErrorAlert(message: "")
}
#endif
