//
//  DefaultFolderPickerRepository-Mac.swift
//  MyLifeHelpingApp
//
//  Created by Ofir Ron on 28/02/2025.
//

import Foundation
//import FoundationCoreKit
#if os(macOS)
import Cocoa

extension DefaultFolderPickerRepository {
    public struct Mac {
        public init() {}
    }
}

extension DefaultFolderPickerRepository.Mac: FolderPicker {
    public func selectFolder() async throws -> URL {
        try await MainActor.run() {
            let panel = NSOpenPanel()
            panel.allowsMultipleSelection = false
            panel.canChooseDirectories = true
            panel.canChooseFiles = false
            
            switch panel.runModal() {
                case .OK: break
                
                case .cancel:
                    throw CancellationError()
                    
                default:
                    throw GenericError("Panel runModal failed")
            }
            
            guard let url = panel.url else {
                throw GenericError("Panel url failed")
            }
            
            return url
        }
    }
}
#endif
