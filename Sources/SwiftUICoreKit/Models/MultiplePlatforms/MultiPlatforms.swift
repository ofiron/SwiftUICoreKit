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
    public typealias Image = UIImage
    public typealias ViewRepresentable = UIViewRepresentable
#elseif os(OSX)
    public typealias Image = NSImage
    public typealias ViewRepresentable = NSViewRepresentable
#endif
}
