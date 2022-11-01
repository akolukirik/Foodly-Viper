//
//  UICollectionView+Ext.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 1.11.2022.
//

import UIKit

public extension UICollectionView {
    var currentPageNumber: Int {
        return Int(ceil(self.contentOffset.x / self.frame.size.width))
    }

    func dequeue<T: UICollectionReusableView>(cell: T.Type, indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withReuseIdentifier: T.nameOfClass, for: indexPath) as? T
    }

    func dequeue<T: UICollectionReusableView>(header: T.Type, indexPath: IndexPath) -> T? {
        return  dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: T.nameOfClass,
            for: indexPath)    as? T
    }

    func dequeue<T: UICollectionReusableView>(footer: T.Type, indexPath: IndexPath) -> T? {
        return  dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: T.nameOfClass,
            for: indexPath)    as? T
    }

    func registerCell<T: UICollectionReusableView>(_ cell: T.Type) {
        register(nibFromClass(cell), forCellWithReuseIdentifier: cell.nameOfClass)
    }

    func registerSectionHeader<T: UICollectionReusableView>(_ header: T.Type) {
        register(nibFromClass(header), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                 withReuseIdentifier: header.nameOfClass)
    }

    func registerSectionFooter<T: UICollectionReusableView>(_ footer: T.Type) {
        register(nibFromClass(footer), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                 withReuseIdentifier: footer.nameOfClass)
    }

    // Private
    fileprivate func nibFromClass(_ type: UICollectionReusableView.Type) -> UINib {
        return UINib(nibName: type.nameOfClass, bundle: nil)
    }
}

extension UICollectionView {
// swiftlint:disable function_default_parameter_at_end
    func dequeue<T: UICollectionViewCell>(withIdentifier identifier: String = String(describing: T.self), for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier \(identifier) from collectionView \(self)")
        }
        return cell
    }
// swiftlint:enable function_default_parameter_at_end
}
