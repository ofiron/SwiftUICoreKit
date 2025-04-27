//
//  MultilinesButton.swift
//  SwiftUICoreKit
//
//  Created by Ofir Ron on 04/04/2025.
//

import SwiftUI

public struct MultilinesButton: View {
    public let lines: [String]

    public let action: () -> Void
    
    public init(title: String, action: @escaping () -> Void) {
        self.lines = title.components(separatedBy: .newlines)
        self.action = action
    }

    public init(_ title: String, action: @escaping () -> Void) {
        self.init(title: title, action: action)
    }

    public var body: some View {
        Button(action: action) {
            VStack {
                ForEach(lines, id: \.self) { line in
                    Text(line)
                }
            }
        }
    }
}

#Preview {
    MultilinesButton(title: "First line\nSecond line\nThird line", action: {})
}
