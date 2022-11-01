//
//  HomePageCollectionViewCell.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 18.10.2022.
//

import UIKit

protocol FoodTableViewCellDelegate {
    func didTappedFood(rowIndex: Int)
}

class HomePageCollectionViewCell: UICollectionViewCell {

    @IBOutlet private var foodImageView: UIImageView!
    @IBOutlet private var foodNameLabel: UILabel!
    @IBOutlet private var foodPriceLabel: UILabel!
    @IBOutlet private var containerView: UIView!

    private var cellIndex: Int = 0
    private var delegate:  FoodTableViewCellDelegate?

    func configure(foodNameLabel: String,
                   foodPriceLabel: String,
                   foodImageView: String,
                   index: Int,
                   delegate: FoodTableViewCellDelegate) {

        self.foodNameLabel.text = foodNameLabel
        self.foodPriceLabel.text = "\(foodPriceLabel) TL"
        self.foodImageView.setImage(imageURL: "\(BaseUrl.imgURL)\(foodImageView)")
        self.cellIndex = index
        self.delegate = delegate

       containerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(containerViewTapped)))
    }

    @objc private func containerViewTapped() {
        delegate?.didTappedFood(rowIndex: cellIndex)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
