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

    static let identifier = "HomePageCollectionViewCell"

    @IBOutlet var foodImageView: UIImageView!
    @IBOutlet var foodNameLabel: UILabel!
    @IBOutlet var foodPriceLabel: UILabel!
    @IBOutlet var containerView: UIView!

    private var cellIndex: Int = 0
    private var delegate:  FoodTableViewCellDelegate?

    private let BaseImgURL = "http://kasimadalan.pe.hu/yemekler/resimler/"

    func configure(foodNameLabel: String,
                   foodPriceLabel: String,
                   foodImageView: String,
                   index: Int,
                   delegate: FoodTableViewCellDelegate) {

        self.foodNameLabel.text = foodNameLabel
        self.foodPriceLabel.text = "\(foodPriceLabel) TL"
        self.foodImageView.setImage(imageURL: "\(BaseImgURL)\(foodImageView)")
        self.cellIndex = index
        self.delegate = delegate

       containerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(containerViewTapped)))
    }

    @objc func containerViewTapped() {
        delegate?.didTappedFood(rowIndex: cellIndex)
    }

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    static func nib() -> UINib {
        return UINib(nibName: "HomePageCollectionViewCell", bundle: nil)
    }

}
