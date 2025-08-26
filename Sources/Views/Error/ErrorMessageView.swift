//
//  ErrorMessageView.swift
//  SwiftUICoreKit
//
//  Created by Ofir Ron on 23/02/2025.
//

import SwiftUI

/// A reusable view component that displays error messages with consistent styling.
///
/// - Parameter message: The error text to display. The view will automatically:
///   - Render nothing if `nil`
///   - Render nothing if empty string
///   - Show styled error text for non-empty values
///
/// This component encapsulates error message presentation logic while maintaining
/// separation from business logic. It works with any view hierarchy through ZStack placement.
public struct ErrorMessageView: View {
    public let message: String?
    
    /// Creates an error message view that automatically handles visibility.
    ///
    /// - Parameter message: The text to display as an error
    /// - Note: The view will render nothing if:
    ///   - The message is `nil`
    ///   - The message is an empty string
    /// - Important: Styling uses `UIStyles.errorFont` and `UIStyles.errorColor`
    public init(message: String?) {
        self.message = message
    }

    public var body: some View {
        if let message = message, !message.isEmpty {
            Text(message)
                .errorStyle()
        }
    }
}

// For previews (only include in debug builds)
#if DEBUG
#Preview {
    ErrorMessageView(message: "This is an error message")
}
#endif
