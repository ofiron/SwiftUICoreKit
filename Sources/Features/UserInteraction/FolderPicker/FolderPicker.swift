//
//  FolderPicker.swift
//  MyLifeHelpingApp
//
//  Created by Ofir Ron on 07/03/2025.
//

import Foundation

/// A protocol that defines an interface for presenting a UI to allow users to pick a folder.
public protocol FolderPicker {
    /// Presents a user interface for folder selection.
    ///
    /// This method asynchronously presents a folder picker UI to the user.
    /// It returns the URL of the selected folder if the user completes the selection.
    ///
    /// - Returns: The URL of the selected folder.
    /// - Throws:
    ///   - `CancellationError` if the user cancels the folder selection.
    ///   - Other errors if the folder selection fails due to other reasons.
    func selectFolder() async throws -> URL
}
