//
//  SwiftUIView.swift
//  
//
//  Created by Ofir Ron on 30/10/2024.
//

import SwiftUI

/// A view that displays a primary view and a secondary view or multiple secondary views in a vertical stack.
///
/// The primary view occupies a specified portion of the available height, while the secondary views fill the remaining space.
///
/// - Parameters:
///   - primaryHeightRatio: The proportion of the total height that the primary view should occupy.
///   - verticalSpacing: The vertical spacing between the primary and secondary views.
///   - horizontalSpacing: The horizontal spacing between the secondary views.
///   - primaryView: A closure that returns the primary view content.
///   - secondariesContent: A closure that returns the secondary views content, which can be a single view or multiple views in an `HStack`.
///
/// - Note: To ensure that the primary and secondary views fill their respective spaces, consider adding to each view:
/// `.frame(maxWidth: .infinity, maxHeight: .infinity)`.

public struct PrimaryAndSecondariesView<PrimaryContent: View,SecondariesContent: View>: View {
    
    /// The primary view content.
    private let primaryView: PrimaryContent
    
    /// The secondary view(s) content.
    private let secondariesContent: SecondariesContent
    
    /// The proportion of the total height that the primary view should occupy.
    private let primaryHeightRatio: Double
    
    /// The proportion of the total height that the secondary view(s) should occupy.
    private let secondariesHeightRatio: Double
    
    /// The vertical spacing between the primary and secondary views.
    private let verticalSpacing: CGFloat?
    
    /// The horizontal spacing between the secondary views.
    private let horizontalSpacing: CGFloat?

    /// Initializes a `PrimaryAndSecondariesView` with the given parameters.
    ///
    /// - Parameters:
    ///   - primaryHeightRatio: The proportion of the total height that the primary view should occupy.
    ///     Must be a value between 0 and 1.
    ///   - verticalSpacing: The vertical spacing between the primary and secondary views.
    ///   - horizontalSpacing: The horizontal spacing between the secondary views.
    ///   - primaryView: A closure that returns the primary view content.
    ///   - secondariesContent: A closure that returns the secondary views content.
    ///
    /// - Warning: Ensure that `primaryHeightRatio` is between 0 and 1. If not, the app will crash.
    ///
    /// - Note: To ensure that the primary and secondary views fill their respective spaces, consider adding to each view:
    /// `.frame(maxWidth: .infinity, maxHeight: .infinity)`.
    public init(
        primaryHeightRatio: Double = 2/3,
        verticalSpacing: CGFloat? = 0,
        horizontalSpacing: CGFloat? = 0,
        
        @ViewBuilder primaryView: @escaping () -> PrimaryContent,
        @ViewBuilder _ secondariesContent: () -> SecondariesContent)
    {
        self.primaryHeightRatio = primaryHeightRatio
        precondition(primaryHeightRatio < 1, "primaryHeightRatio must be less than 1 like 2/3")
        self.secondariesHeightRatio = 1 - primaryHeightRatio
        self.verticalSpacing = verticalSpacing
        self.horizontalSpacing = horizontalSpacing
        self.secondariesContent = secondariesContent()
        self.primaryView = primaryView()
    }

    public var body: some View {
        GeometryReader { geometry in
            VStack(spacing: verticalSpacing) {
                primaryView
                    .frame(maxWidth: .infinity, maxHeight: geometry.size.height * primaryHeightRatio)
                
                HStack(spacing: horizontalSpacing) {
                    secondariesContent
                }
                .frame(maxWidth: .infinity, maxHeight: geometry.size.height * secondariesHeightRatio)
            }
        }
    }
}

#Preview {
    PrimaryAndSecondariesView(
        primaryView: {
            Text("This is primary view")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.red)
        }) {
            Text("Secondary View 1")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.green)
            
            Text("Secondary View 2")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.blue)
            
            Text("Secondary View 3")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.yellow)
        }
}
