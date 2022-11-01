//
//  UITableView+Ext.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 21.10.2022.
//

import Foundation
import UIKit

public extension UITableView {

    func dequeue<T: UITableViewCell>(withIdentifier identifier: String = String(describing: T.self)) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier) as? T
            else { fatalError("Could not dequeue cell with identifier \(identifier) from tableView \(self)") }
        return cell
    }

    func dequeue<T: UITableViewCell>(withIdentifier identifier: String = String(describing: T.self), at indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T
            else { fatalError("Could not dequeue cell with identifier \(identifier) from tableView \(self)") }
        return cell
    }

    func registerCell<T: UITableViewCell>(_ cell: T.Type) {
        register(nibFromClass(cell), forCellReuseIdentifier: cell.nameOfClass)
    }

    func registerFooterView<T: UITableViewHeaderFooterView>(_ cell: T.Type) {
        register(
            nibFromClass(cell),
            forHeaderFooterViewReuseIdentifier:
            cell.nameOfClass)
    }

    // Private
    fileprivate func nibFromClass(_ type: UIView.Type) -> UINib {
        return UINib(nibName: type.nameOfClass, bundle: nil)
    }
}

extension UITableView {
    var visibleSectionHeaders: [UITableViewHeaderFooterView] {
        get {
            var headerViews = [UITableViewHeaderFooterView]()
            if let visibleRows = self.indexPathsForVisibleRows {
                let visibleSections = visibleRows.map({$0.section})
                visibleSections.forEach { (index) in
                    if let view = self.headerView(forSection: index) {
                        headerViews.append(view)
                    }
                }

            }
            return headerViews
        }
    }

    private func indexesOfVisibleSections() -> [Int] {
        var visibleSectionIndexes = [Int]()

        for index in 0...numberOfSections {
            var headerRect: CGRect?

            if self.style == .plain {
                headerRect = self.rect(forSection: index)
            } else {
                headerRect = self.rectForHeader(inSection: index)
            }

            if headerRect != nil {
                let visiblePartOfTableView: CGRect = CGRect(
                    x: self.contentOffset.x,
                    y: self.contentOffset.y,
                    width: self.bounds.size.width,
                    height: self.bounds.size.height
                )

                if visiblePartOfTableView.intersects(headerRect!) {
                    visibleSectionIndexes.append(index)
                }
            }
        }

        return visibleSectionIndexes
    }
}
