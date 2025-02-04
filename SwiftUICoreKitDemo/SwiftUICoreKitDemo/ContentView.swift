//
//  ContentView.swift
//  SwiftUICoreKitDemo
//
//  Created by Ofir Ron on 04/02/2025.
//

import SwiftUI
import SwiftUICoreKit

struct ContentView: View {
    @State private var textFromPackage = ""

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")

            Button("Some action from package") {
                let screenFactor = MultiPlatforms.Helpers.screenFactor()
                textFromPackage = "\(screenFactor)"
            }

            Text("The screen factor from package")
            Text(textFromPackage)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
