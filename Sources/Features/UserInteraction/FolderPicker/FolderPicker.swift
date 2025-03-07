//
//  FolderPicker.swift
//  MyLifeHelpingApp
//
//  Created by Ofir Ron on 07/03/2025.
//

import Foundation

/// A protocol for allowing the user to select a folder.
public protocol FolderPicker {
    /// Presents a UI for the user to select a folder.
    /// - Returns: The URL of the selected folder.
    /// - Throws: An error if the folder selection fails.
    func selectFolder() async throws -> URL
}
