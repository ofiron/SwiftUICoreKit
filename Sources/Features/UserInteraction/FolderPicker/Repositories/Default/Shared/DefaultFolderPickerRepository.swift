//
//  DefaultFolderPickerRepository.swift
//  MyLifeHelpingApp
//
//  Created by Ofir Ron on 28/02/2025.
//

import Foundation
#if canImport(UIKit)
import UIKit
#endif

public struct DefaultFolderPickerRepository: FolderPicker {
    private var underlineFolderPicker: FolderPicker
    
    public init() {
#if os(macOS)
        underlineFolderPicker = Mac()
#elseif os(iOS)
        underlineFolderPicker = Ios(presentingViewController: nil)
#else
        fatalError("unsupported platform in \(type(of: self)) init")
#endif
    }
    
    public func selectFolder() async throws -> URL {
        try await underlineFolderPicker.selectFolder()
    }
}
