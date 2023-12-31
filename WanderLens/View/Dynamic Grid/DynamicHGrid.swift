//
//  DynamicHGrid.swift
//  WanderLens
//
//  Created by Telem Tobi on 25/09/2023.
//

import SwiftUI

struct DynamicHGrid: Layout {

    private var rows: Int
    private var spacing: Double

    init(rows: Int = 2, spacing: Double = 10) {
        self.rows = rows
        self.spacing = spacing
    }

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        calculateSize(for: subviews, in: proposal)
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        calculateSize(for: subviews, in: proposal, placeInBounds: bounds)
    }

    @discardableResult
    private func calculateSize(for subviews: Subviews, in proposal: ProposedViewSize, placeInBounds bounds: CGRect? = nil) -> CGSize {
        guard let maxHeight = proposal.height else { return .zero }
        
        let itemHeight = (maxHeight - spacing * Double(rows - 1)) / Double(rows)

        var yIndex: Int = 0
        var rowsWidths: [Double] = Array(repeating: bounds?.minX ?? 0, count: rows)

        subviews.forEach { view in
            let proposed = ProposedViewSize(
                width: view.sizeThatFits(.unspecified).width,
                height: itemHeight
            )

            if let bounds {
                let y = (itemHeight + spacing) * Double(yIndex) + bounds.minY
                view.place(
                    at: .init(x: rowsWidths[yIndex], y: y),
                    anchor: .topLeading,
                    proposal: proposed
                )
            }

            let width = view.dimensions(in: proposed).width
            rowsWidths[yIndex] += width + spacing
            
            let minimum = rowsWidths.enumerated().min { $0.element < $1.element }?.offset ?? 0
            yIndex = minimum
        }

        guard let maxWidth = rowsWidths.max() else { return .zero }

        return .init(
            width: maxWidth - spacing,
            height: maxHeight
        )
    }

    static var layoutProperties: LayoutProperties {
        var properties = LayoutProperties()
        properties.stackOrientation = .horizontal
        return properties
    }
}
