//
//  CheckOutPageViewController.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 26.10.2022.
//  
//

import Foundation
import UIKit

extension CheckOutPageViewController {
    private enum Constants {
        static let deliverPrice: Int = 10
    }
}

protocol ICheckOutPageViewController: IBaseView {

}

class CheckOutPageViewController: BaseViewController, StoryboardLoadable {

    @IBOutlet private var creditCardTextField: UITextField!
    @IBOutlet private var subtotalPriceLabel: UILabel!
    @IBOutlet private var totalPriceLabel: UILabel!

    var presenter: ICheckOutPagePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

        let total = BasketHandler.shared.totalPrice + Constants.deliverPrice
        subtotalPriceLabel.text = "\(BasketHandler.shared.totalPrice) TL"
        totalPriceLabel.text = "\(total) TL"

        creditCardTextField.addTarget(self,
                                      action: #selector(didChangeText(textField:)),
                                      for: .editingChanged)
    }

    @IBAction private func backButtonClicked(_ sender: Any) {
        presenter?.dismissPage()
    }

    @IBAction private func checkOutButtonClicked(_ sender: Any) {
        presenter?.navigateOrderTrack()
    }
}

extension CheckOutPageViewController: ICheckOutPageViewController {

}

extension CheckOutPageViewController {

    @objc private func didChangeText(textField: UITextField) {
        textField.text = self.modifyCreditCardString(creditCardString: textField.text!)
    }

    private func modifyCreditCardString(creditCardString: String) -> String {
        let trimmedString = creditCardString.components(separatedBy: .whitespaces).joined()

        let arrOfCharacters = Array(trimmedString)
        var modifiedCreditCardString = ""

        if(arrOfCharacters.count > 0) {
            for i in 0...arrOfCharacters.count-1 {
                modifiedCreditCardString.append(arrOfCharacters[i])
                if((i+1) % 4 == 0 && i+1 != arrOfCharacters.count){
                    modifiedCreditCardString.append(" ")
                }
            }
        }
        return modifiedCreditCardString
    }
}
