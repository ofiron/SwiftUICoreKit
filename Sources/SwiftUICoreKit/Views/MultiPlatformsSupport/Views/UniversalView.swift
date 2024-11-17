//
//  UniversalView.swift
//
//
//  Created by Ofir Ron on 17/11/2024.
//

#if canImport(UIKit)
    import UIKit
#elseif canImport(AppKit)
    import AppKit
#endif

extension MultiPlatforms.View {
    public var universalBackgroundColor: MultiPlatforms.Color? {
        set {
            #if os(iOS)
                backgroundColor = newValue

            #elseif os(OSX)
                guard let newValue = newValue else {
                    wantsLayer = false
                    return
                }

                wantsLayer = true
                layer?.backgroundColor = newValue.cgColor
            #endif

        }
        get {
            #if os(iOS)
                backgroundColor

            #elseif os(OSX)
                guard
                    let layer = layer,
                    let backgroundColor = layer.backgroundColor
                else { return nil }

                return NSColor(cgColor: backgroundColor)
            #endif
        }
    }
}
