//
//  ViewControllerUtils.swift
//
//
//  Created by Ofir Ron on 18/11/2024.
//

#if os(iOS)
import UIKit
#endif
import SwiftUICoreKit

/// A utility class for common view controller operations.
public class ViewControllerUtils {
    /// A generic view controller type that can represent both UIKit and AppKit view controllers.
    public typealias ViewController = MultiPlatforms.ViewController

    /// Finds the topmost visible view controller within the view hierarchy.
    ///
    /// - Parameter base: The optional root view controller to start searching from.
    /// - Returns: The topmost view controller, or `nil` if not found.
    public static func topViewController(base: ViewController? = nil) -> ViewController? {
        #if os(iOS)
            inner_iOS_topViewController(base: base)
        #elseif os(macOS)
            fatalError("\(type(of: self)) not yet support topViewController for mac")
        #endif
    }
}

#if os(iOS)
extension ViewControllerUtils {
    /// Find the current top view controller for your iOS applications
    ///
    /// Based on https://gist.github.com/snikch/3661188 in comment of [Yonat](https://gist.github.com/yonat)
    ///
    /// - Parameter base: An optional base view controller to start searching from.
    /// - Returns: The topmost visible view controller.
    static func inner_iOS_topViewController(base: ViewController? = nil) -> ViewController? {
        //let base = base ?? UIApplication.shared.keyWindow?.rootViewController
        let base = base ?? (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }

        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }

        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }

        return base
    }
}
#endif
