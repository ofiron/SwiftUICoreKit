//
//  DocumentSelectionView.swift
//
//
//  Created by Ofir Ron on 27/10/2024.
//

import AVFoundation
import SwiftUI

/// A view for selecting a document from the user's device.
///
/// Supports both iOS and macOS platforms.
public struct DocumentSelectionView: View {
    /// The selected URL, updated when a document is chosen.
    @Binding public var url: URL?

    /// The allowed content types for the document picker.
    public let contentTypes: [UTType]

    /// A closure to be executed when a document is selected.
    public let completion: (URL) -> Void

#if os(OSX)
    @State private var isShowingFilePicker = false
#endif

    public var body: some View {
        osSpecificView
    }

    var osSpecificView: some View {
#if os(iOS)
        DocumentPicker(url: $url, contentTypes: contentTypes, completion: completion)
#elseif os(OSX)
        Color.clear
            .frame(width: 0, height: 0)
            .onAppear {
                isShowingFilePicker = true
            }
            .fileImporter(
                isPresented: $isShowingFilePicker,
                allowedContentTypes: contentTypes,
                allowsMultipleSelection: false
            ) { result in
                switch result {
                case .success(let urls):
                    guard let selectedURL = urls.first else { return }
                    url = selectedURL
                    completion(selectedURL)
                case .failure(let error):
                    print("Error selecting file: \(error.localizedDescription)")
                }
                // If you want to allow reselection, uncomment the next line
                // isShowingFilePicker = true
            }
#endif
    }
}

#if os(iOS)
extension DocumentSelectionView {
    struct DocumentPicker {
        @Binding var url: URL?
        let contentTypes: [UTType]
        let completion: (URL) -> Void
    }
}

extension DocumentSelectionView.DocumentPicker: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let picker = UIDocumentPickerViewController(forOpeningContentTypes: contentTypes)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UIDocumentPickerDelegate {
        let parent: DocumentSelectionView.DocumentPicker

        init(_ parent: DocumentSelectionView.DocumentPicker) {
            self.parent = parent
        }

        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            guard let url = urls.first else { return }
            parent.url = url
            parent.completion(url)
        }
    }
}
#endif

#Preview {
    DocumentSelectionView(url: .constant(nil), contentTypes: [.audio]) { url in

    }
}

#Preview {
    DocumentSelectionView(url: .constant(nil), contentTypes: [.audio]) { url in

    }
    .previewDevice(PreviewDevice(rawValue: "Mac"))
}

