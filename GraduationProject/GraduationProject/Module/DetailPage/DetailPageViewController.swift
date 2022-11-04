//
//  DetailPageViewController.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 17.10.2022.
//  
//

import Foundation
import UIKit

protocol IDetailPageViewController: IBaseView {
    func setTitleLabelText(_ text: String, image: String, price: String)
    func setCounterAndTotalValue(counter: Int, total: Int)
}

class DetailPageViewController: BaseViewController, StoryboardLoadable {

    @IBOutlet var foodNameLabel: UILabel!
    @IBOutlet var foodPriceLabel: UILabel!
    @IBOutlet var foodImageview: UIImageView!
    @IBOutlet var totalPriceLabel: UILabel!
    @IBOutlet var counterLabel: UILabel!

    var presenter: IDetailPagePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        counterLabel.text = "\(presenter?.counter ?? 1)"
        totalPriceLabel.text = "\(presenter?.getFoodPrice ?? "") TL"
    }

    @IBAction func toBasketButton(_ sender: Any) {
        presenter?.createNewOrder(foodOrderCount: "\(presenter?.counter ?? 1)", userName: "akolukirik")
        self.dismiss(animated: true)
    }

    @IBAction func increaseButton(_ sender: Any) {
        presenter?.increaseFoodCount()
    }

    @IBAction func decreaseButton(_ sender: Any) {
        presenter?.decreaseFooudCount()
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        presenter?.dismissPage()
    }
}

extension DetailPageViewController: IDetailPageViewController {
    func setCounterAndTotalValue(counter: Int, total: Int) {
        counterLabel.text = "\(counter)"
        totalPriceLabel.text = "\(total) TL"
    }

    func setTitleLabelText(_ text: String, image: String, price: String) {
        foodNameLabel.text = text
        foodPriceLabel.text = "\(price) TL"
        foodImageview.setImage(imageURL: "\(presenter?.imgUrl ?? "")")
    }
}
