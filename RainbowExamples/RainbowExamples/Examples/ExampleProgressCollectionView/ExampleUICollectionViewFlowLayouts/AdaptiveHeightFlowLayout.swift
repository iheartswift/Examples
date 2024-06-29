//
//  AdaptiveHeightFlowLayout.swift
//  RainbowExamples
//
//  Created by Adam Dahan on 2024-06-27.
//

import UIKit

class AdaptiveHeightFlowLayout: UICollectionViewFlowLayout {
    private var cache: [UICollectionViewLayoutAttributes] = []
    private var contentHeight: CGFloat = 0
    private var contentWidth: CGFloat {
        guard let collectionView = collectionView else { return 0 }
        let insets = collectionView.contentInset
        return collectionView.bounds.width - (insets.left + insets.right)
    }

    override func prepare() {
        guard let collectionView = collectionView else { return }

        cache.removeAll()
        contentHeight = 0

        let numberOfColumns = 3
        let columnWidth = contentWidth / CGFloat(numberOfColumns)
        var xOffset: [CGFloat] = []
        for column in 0..<numberOfColumns {
            xOffset.append(CGFloat(column) * columnWidth)
        }
        var column = 0
        var yOffset: [CGFloat] = .init(repeating: 0, count: numberOfColumns)

        for section in 0..<collectionView.numberOfSections {
            if let headerAttributes = layoutAttributesForSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, at: IndexPath(item: 0, section: section)) {
                cache.append(headerAttributes)
                yOffset = yOffset.map { $0 + headerAttributes.frame.height }
            }

            for item in 0..<collectionView.numberOfItems(inSection: section) {
                let indexPath = IndexPath(item: item, section: section)

                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                let width = columnWidth
                let cellHeight = (collectionView.delegate as? AdaptiveHeightDelegate)?.collectionView(collectionView, heightForItemAt: indexPath, withWidth: width) ?? 100
                let frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: cellHeight)
                let insetFrame = frame.insetBy(dx: 5, dy: 5)

                attributes.frame = insetFrame
                cache.append(attributes)

                contentHeight = max(contentHeight, frame.maxY)
                yOffset[column] = yOffset[column] + cellHeight
                column = column < (numberOfColumns - 1) ? (column + 1) : 0
            }

            if let footerAttributes = layoutAttributesForSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, at: IndexPath(item: 0, section: section)) {
                cache.append(footerAttributes)
                yOffset = yOffset.map { $0 + footerAttributes.frame.height }
            }
        }
    }

    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return cache.filter { $0.frame.intersects(rect) }
    }

    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache.first { $0.indexPath == indexPath }
    }

    override func layoutAttributesForSupplementaryView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let collectionView = collectionView else { return nil }

        let attributes = UICollectionViewLayoutAttributes(forSupplementaryViewOfKind: elementKind, with: indexPath)
        let width = contentWidth
        let height: CGFloat

        if elementKind == UICollectionView.elementKindSectionHeader {
            height = (collectionView.delegate as? AdaptiveHeightDelegate)?.collectionView(collectionView, heightForHeaderAt: indexPath.section, withWidth: width) ?? 50
        } else {
            height = (collectionView.delegate as? AdaptiveHeightDelegate)?.collectionView(collectionView, heightForFooterAt: indexPath.section, withWidth: width) ?? 50
        }

        attributes.frame = CGRect(x: 0, y: contentHeight, width: width, height: height)
        contentHeight += height

        return attributes
    }

    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}

protocol AdaptiveHeightDelegate: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, heightForItemAt indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat
    func collectionView(_ collectionView: UICollectionView, heightForHeaderAt section: Int, withWidth width: CGFloat) -> CGFloat
    func collectionView(_ collectionView: UICollectionView, heightForFooterAt section: Int, withWidth width: CGFloat) -> CGFloat
}
