//
//  MultiPlatforms-Helpers.swift
//
//
//  Created by Ofir Ron on 27/11/2024.
//

import Foundation
#if os(iOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

extension MultiPlatforms {
    /// Provides utility functions for various platform-specific tasks.
    public enum Helpers {
        /// Calculates the screen scale factor for the current platform.
        ///
        /// - Returns: The screen scale factor.
        public static func screenFactor() -> CGFloat {
            #if os(iOS)
            let factor = UIScreen.main.scale
            #elseif os(macOS)
            let factor = NSScreen.main?.backingScaleFactor ?? 1
            #endif

            return factor
        }
    }
}
