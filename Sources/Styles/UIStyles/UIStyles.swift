//
//  UIStyles.swift
//  SwiftUICoreKit
//
//  Created by Ofir Ron on 23/02/2025.
//

import SwiftUI

/// A namespace for defining standardized UI styles used throughout the application.
///
/// Use `UIStyles` to maintain visual consistency across components. These values represent
/// the application's design system for error messaging and can be customized to match
/// your theme requirements.
///
/// # Overview
/// ```swift
/// // Customize early in app initialization
/// UIStyles.errorFont = .largeTitle
/// UIStyles.errorColor = .orange
/// ```
public enum UIStyles {
    /// The typographic style for error message text.
    ///
    /// Default Value: `Font.title`
    ///
    /// - Note: Change this value to match your application's typography scale.
    /// - Important: Set this before any views using it are created for consistent behavior.
    @MainActor public static var errorFont = Font.title
    
    /// The color used for error message text.
    ///
    /// Default Value: `Color.red`
    ///
    /// - Note: Use this for all error text to maintain consistent visual language.
    /// - Important: For accessibility, ensure sufficient contrast with background colors.
    @MainActor public static var errorColor = Color.red
}
