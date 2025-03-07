//
//  MultiPlatforms-Pasteboard.swift.swift
//  SwiftUICoreKit
//
//  Created by Ofir Ron on 07/03/2025.
//

#if canImport(UIKit)
    import UIKit
#elseif canImport(AppKit)
    import AppKit
#endif

extension MultiPlatforms.Pasteboard {
    /// Stores a string in the system pasteboard
    /// - Parameter simpleString: The string to store. Pass `nil` to clear the pasteboard.
    ///
    /// # Platform Behavior
    /// - iOS: Directly sets the pasteboard string
    /// - macOS: Clears existing contents before setting new string
    public func setSimpleString(_ simpleString: String?) {
#if os(iOS)
        self.string = simpleString
#elseif os(OSX)
        clearContents()
        guard  let simpleString else { return }
        setString(simpleString, forType: .string)
#else
        fatalError("Not Implemented for this OS")
#endif
    }

    /// Retrieves a string from the system pasteboard
    /// - Returns: The current string content of the pasteboard, or `nil` if unavailable
    ///
    /// # Platform Notes
    /// - iOS: Returns the first available string from the pasteboard
    /// - macOS: Returns the string content if available in NSPasteboard.PasteboardType.string format
    public func getSimpleString() -> String? {
#if os(iOS)
        return self.string
#elseif os(OSX)
        return string(forType: .string) as String?
#else
        fatalError("Not Implemented for this OS")
#endif
    }
}
