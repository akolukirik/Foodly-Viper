//
//  Collection+Ext.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 1.11.2022.
//

extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
