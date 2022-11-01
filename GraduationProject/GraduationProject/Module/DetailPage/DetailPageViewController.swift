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
}

class DetailPageViewController: BaseViewController, StoryboardLoadable {

    @IBOutlet var foodNameLabel: UILabel!
    @IBOutlet var foodPriceLabel: UILabel!
    @IBOutlet var foodImageview: UIImageView!
    @IBOutlet var totalPriceLabel: UILabel!
    @IBOutlet var counterLabel: UILabel!

    var counter = 1

    var presenter: IDetailPagePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        counterLabel.text = "\(counter)"
        totalPriceLabel.text = "\(presenter?.getFoodPrice ?? "") TL"
    }

    @IBAction func toBasketButton(_ sender: Any) {
        presenter?.createNewOrder(foodOrderCount: "\(counter)", userName: "akolukirik")
        self.dismiss(animated: true)
    }

    @IBAction func increaseButton(_ sender: Any) {
        counter += 1
        counterLabel.text = "\(counter)"
        let total = counter * (Int(presenter?.getFoodPrice ?? "") ?? 1)
        totalPriceLabel.text = "\(total) TL"
        
    }

    @IBAction func decreaseButton(_ sender: Any) {
        if counter > 1 {
            counter -= 1
            counterLabel.text = "\(counter)"
            let total = counter * (Int(presenter?.getFoodPrice ?? "") ?? 1)
            totalPriceLabel.text = "\(total) TL"
        }
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        presenter?.dismissPage()
    }
    
}

extension DetailPageViewController: IDetailPageViewController {
    func setTitleLabelText(_ text: String, image: String, price: String) {
        foodNameLabel.text = text
        foodPriceLabel.text = "\(price) TL"
        foodImageview.setImage(imageURL: "\(BaseUrl.imgURL)\(image)")
    }
}
