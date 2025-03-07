//
//  DeprecatedUI.swift
//  MyLifeHelpingApp
//
//  Created by Ofir Ron on 28/02/2025.
//

#if canImport(UIKit)
import UIKit
#endif

/// A temporary container for deprecated UI-related code that needs to be migrated to modern APIs.
///
/// - Warning: This struct exists solely to isolate deprecated code and suppress compiler warnings.
///            All contained APIs should be considered temporary and must be migrated to modern equivalents.
///
/// - Important: The code in this struct uses deprecated UIKit APIs that will stop working in future iOS versions.
///              Do NOT use these patterns as reference for new code.
///
/// - Example: Migration path for window handling
/// ```swift
/// // Modern approach (iOS 13+)
/// UIApplication.shared.connectedScenes
///     .compactMap { $0 as? UIWindowScene }
///     .flatMap(\.windows)
///     .first(where: \.isKeyWindow)?
///     .rootViewController
/// ```
//@available(iOS, deprecated: 15.0, message: "This entire struct should be removed after migrating to window scene APIs")
public struct DeprecatedUI {
    public struct Ios {}
}

#if os(iOS)
extension DeprecatedUI.Ios {
    /// Retrieves the root view controller using deprecated window handling
    ///
    /// - Warning: This uses the deprecated `UIApplication.windows` API
    /// - Returns: The root view controller of the first window, if available
    /// - Important: This will return nil in multi-scene applications and on iOS 15+
    ///
    /// # Migration Guide
    /// 1. Identify all call sites using this method
    /// 2. Replace with modern window scene API
    /// 3. Test with multiple scene support
//    @available(iOS, deprecated: 15.0, message: "Use window scene API instead - see method documentation")
    @MainActor public static func getRootViewController() -> UIViewController? {
        // No warnings will appear here
        return UIApplication.shared.windows.first?.rootViewController
        /*
        if #available(iOS 13.0, *) {
            // Use modern window scene API
            return UIApplication.shared.connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .first?
                .windows
                .first?
                .rootViewController
        } else {
            // Fallback to deprecated API for older iOS versions
            return UIApplication.shared.windows.first?.rootViewController
        }
        */
    }
}
#endif
