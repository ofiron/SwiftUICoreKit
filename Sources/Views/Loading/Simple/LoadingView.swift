//
//  LoadingView.swift
//
//
//  Created by Ofir Ron on 17/11/2024.
//

import SwiftUI

/// Defines a simple loading view
public struct LoadingView: View {
    public var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .edgesIgnoringSafeArea(.all)

            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .scaleEffect(2)
        }
    }
    
    public init() {}
}

/// A view modifier to present a fullscreen loading view
///
/// This view modifier displays a fullscreen loading view when `isPresented` is true
public struct FullScreenLoadingView: ViewModifier {
    @Binding public var isPresented: Bool

    public init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
    }

    public func body(content: Content) -> some View {
        #if os(iOS)
        content
            .fullScreenCover(isPresented: $isPresented) {
                LoadingView()
                    .presentationBackground(.black.opacity(0.5))
            }
        #else
        content
            .sheet(isPresented: $isPresented) {
                LoadingView()
                    .presentationBackground(.black.opacity(0.5))
            }
        #endif
    }
}

#Preview {
    LoadingView()
}
