//
//  MultiPlatforms.swift
//
//
//  Created by Ofir Ron on 27/10/2024.
//

import Foundation
import SwiftUI
#if canImport(UIKit)
    import UIKit
#elseif canImport(AppKit)
    import AppKit
#endif

/// Provides platform-agnostic type aliases for common UI elements.
public enum MultiPlatforms {
#if os(iOS)
    public typealias Color = UIColor
    public typealias Image = UIImage
    public typealias View = UIView
    public typealias ViewRepresentable = UIViewRepresentable
    public typealias ViewController = UIViewController
    public typealias ViewControllerRepresentable = UIViewControllerRepresentable

    /// Type alias for platform-appropriate pasteboard
    /// - iOS: `UIPasteboard` from UIKit
    public typealias Pasteboard = UIPasteboard
#elseif os(OSX)
    public typealias Color = NSColor
    public typealias Image = NSImage
    public typealias View = NSView
    public typealias ViewRepresentable = NSViewRepresentable
    public typealias ViewController = NSViewController
    public typealias ViewControllerRepresentable = NSViewControllerRepresentable

    /// Type alias for platform-appropriate pasteboard
    /// - macOS: `NSPasteboard` from AppKit
    public typealias Pasteboard = NSPasteboard
#endif
}
