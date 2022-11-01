//
//  NSObject+Ext.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 21.10.2022.
//

import Foundation

extension NSObject {
    class var nameOfClass: String {
        return String(describing: self)
    }
}
