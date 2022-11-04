//
//  OnboardingPageCollectionViewCell.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 19.10.2022.
//

import UIKit

class OnboardingPageCollectionViewCell: UICollectionViewCell {

    @IBOutlet private var onboardingImageView: UIImageView!
    @IBOutlet private var onboardingTitleLabel: UILabel!
    @IBOutlet private var onboardingDescriptionLabel: UITextView!

    func configure(_ slide: OnboardingSlide) {
        self.onboardingImageView.image = slide.image
        self.onboardingTitleLabel.text = slide.title
        self.onboardingDescriptionLabel.text = slide.description
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
