//
//  DefaultFolderPickerRepository.swift
//  MyLifeHelpingApp
//
//  Created by Ofir Ron on 28/02/2025.
//

import Foundation
#if canImport(UIKit)
import UIKit
import SwiftUICoreKit
#endif

public struct DefaultFolderPickerRepository: FolderPicker {
    private var underlineFolderPicker: FolderPicker
    
    public init() {
#if os(macOS)
        underlineFolderPicker = Mac()
#elseif os(iOS)
        // TODO: NOW: Fix this
//        underlineFolderPicker = Ios(presentingViewController: DeprecatedUI.Ios.getRootViewController())
        fatalError("unsupported platform in \(type(of: self)) init")
#else
        fatalError("unsupported platform in \(type(of: self)) init")
#endif
    }
    
    public func selectFolder() async throws -> URL {
        try await underlineFolderPicker.selectFolder()
    }
}
