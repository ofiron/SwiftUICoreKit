//
//  DefaultFolderPickerRepository-Ios.swift
//  MyLifeHelpingApp
//
//  Created by Ofir Ron on 28/02/2025.
//

import Foundation
import FoundationCoreKit

#if os(iOS)
import UIKit
import UniformTypeIdentifiers

extension DefaultFolderPickerRepository {
    public class Ios: NSObject, @unchecked Sendable {
        private weak var presentingViewController: UIViewController?
        private var folderSelectionContinuation: CheckedContinuation<URL, Error>?

        public init(presentingViewController: UIViewController?) {
            self.presentingViewController = presentingViewController
            super.init()
        }

    }
}

extension DefaultFolderPickerRepository.Ios: FolderPicker {
    public func selectFolder() async throws -> URL {
        if presentingViewController != nil {
            presentingViewController = await DeprecatedUI.Ios.getRootViewController()
        }
        
        guard presentingViewController != nil else {
            throw GenericError("\(type(of: self)) presented from a view controller that is not available")
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            DispatchQueue.main.async {
                let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [.folder])
                documentPicker.delegate = self
                documentPicker.allowsMultipleSelection = false
                self.folderSelectionContinuation = continuation
                self.presentingViewController?.present(documentPicker, animated: true)
            }
        }
    }
}

extension DefaultFolderPickerRepository.Ios: UIDocumentPickerDelegate {
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let url = urls.first else {
            folderSelectionContinuation?.resume(throwing: GenericError("In \(type(of: self)) No folder selected"))
            return
        }
        
        folderSelectionContinuation?.resume(returning: url)
    }
    
    public func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        folderSelectionContinuation?.resume(throwing: CancellationError())
    }
}

#endif
