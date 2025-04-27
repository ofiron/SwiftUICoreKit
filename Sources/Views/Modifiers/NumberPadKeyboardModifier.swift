//
//  NumberPadKeyboardModifier.swift
//  SwiftUICoreKit
//
//  Created by Ofir Ron on 27/04/2025.
//

import SwiftUI

public struct KeyboardConditionalTypeModifier: ViewModifier {
    public enum KeyboardType : Int, @unchecked Sendable {
        case `default`
        case numberPad
        case decimalPad
        case emailAddress
        case phonePad
    }
    
    let keyboardType: KeyboardType
    
    public init(_ keyboardType: KeyboardType) {
        self.keyboardType = keyboardType
    }

    public func body(content: Content) -> some View {
#if os(iOS)
        content.keyboardType(keyboardType.uiKeyboardType)
#else
        return content
#endif
    }
}

#if os(iOS)
extension KeyboardConditionalTypeModifier.KeyboardType {
    var uiKeyboardType: UIKeyboardType {
        switch self {
        case .default:
            return .default
        case .numberPad:
            return .numberPad
        case .decimalPad:
            return .decimalPad
        case .emailAddress:
            return .emailAddress
        case .phonePad:
            return .phonePad
        }
    }
}
#endif

extension View {
    func keyboardConditionalType(_ keyboardType: KeyboardConditionalTypeModifier.KeyboardType) -> some View {
        self.modifier(KeyboardConditionalTypeModifier(keyboardType))
    }
}

#Preview {
    @Previewable @State var minutesString: String = "0"
    
    TextField("Minutes", text: $minutesString)
        .keyboardConditionalType(.numberPad)
}
