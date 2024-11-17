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

/// Enum for supporting both iOS and Mac OSX entities together in the same code
public enum MultiPlatforms {
#if os(iOS)
    public typealias Color = UIColor
    public typealias Image = UIImage
    public typealias View = UIView
    public typealias ViewRepresentable = UIViewRepresentable
    public typealias ViewController = UIViewController
    public typealias ViewControllerRepresentable = UIViewControllerRepresentable
#elseif os(OSX)
    public typealias Color = NSColor
    public typealias Image = NSImage
    public typealias View = NSView
    public typealias ViewRepresentable = NSViewRepresentable
    public typealias ViewController = NSViewController
    public typealias ViewControllerRepresentable = NSViewControllerRepresentable
#endif
}
