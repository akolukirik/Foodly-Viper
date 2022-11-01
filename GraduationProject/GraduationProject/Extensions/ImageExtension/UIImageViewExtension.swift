//
//  UIImageViewExtension.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 21.10.2022.
//

import Foundation
import Kingfisher
import UIKit

extension UIImageView {
    func setImage(imageURL: String) {
        self.kf.setImage(with: URL(string: imageURL))
    }
}
