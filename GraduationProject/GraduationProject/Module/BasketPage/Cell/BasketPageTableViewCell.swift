//
//  BasketPageTableViewCell.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 17.10.2022.
//

import UIKit

protocol BasketPageCellDelegate {
    func increaseButtonClicked(foodCount: Int, index: Int, foodName: String, foodImage: String, foodPrice: String)
    func decreaseButtonClicked(foodCount: Int, index: Int, foodName: String, foodImage: String, foodPrice: String)
}

class BasketPageTableViewCell: UITableViewCell {

    @IBOutlet var basketImageView: UIImageView!
    @IBOutlet var basketFoodName: UILabel!
    @IBOutlet var basketFoodCount: UILabel!
    @IBOutlet var basketFoodTotalPrice: UILabel!

    private var counter: Int = 1
    private var price : Int = 1
    private var cellIndex: Int = 0
    private var delegate: BasketPageCellDelegate?

    private var foodName: String = ""
    private var foodImage: String = ""
    private var foodPrice: String = ""

    func configure(basketFoodName: String,
                   basketFoodCount: String,
                   basketImageView: String,
                   basketFoodPrice: String,
                   index: String,
                   delegate: BasketPageCellDelegate) {

        counter = Int(basketFoodCount) ?? 1
        price = Int(basketFoodPrice) ?? 1

        self.basketFoodName.text = basketFoodName
        self.basketFoodCount.text = "\(counter)"
        self.basketImageView.setImage(imageURL: "\(BaseUrl.imgURL)\(basketImageView)")
        self.basketFoodTotalPrice.text = "\(counter * price) TL"
        self.delegate = delegate
        self.cellIndex = Int(index) ?? 0

        self.foodName = basketFoodName
        self.foodImage = basketImageView
        self.foodPrice = basketFoodPrice
    }

    @IBAction private func decreaseButton(_ sender: Any) {
        if counter > 1 {
            counter -= 1
            basketFoodCount.text = String(counter)
            basketFoodTotalPrice.text = "\(counter * price) TL"
        }

        delegate?.increaseButtonClicked(foodCount: counter,
                                        index: cellIndex,
                                        foodName: foodName,
                                        foodImage: foodImage,
                                        foodPrice: foodPrice)
    }

    @IBAction private func increaseButton(_ sender: Any) {
        counter += 1
        basketFoodCount.text = String(counter)
        basketFoodTotalPrice.text = "\(counter * price) TL"

        delegate?.increaseButtonClicked(foodCount: counter, index: cellIndex,
                                        foodName: foodName,
                                        foodImage: foodImage,
                                        foodPrice: foodPrice)
    }

}
