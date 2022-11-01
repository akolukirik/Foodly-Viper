//
//  PaymentMethodPageViewController.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 26.10.2022.
//  
//

import Foundation
import UIKit

protocol IPaymentMethodPageViewController: IBaseView {

}

class PaymentMethodPageViewController: BaseViewController, StoryboardLoadable {

    @IBOutlet private var creditCardView: UIView!
    @IBOutlet private var payPalView: UIView!
    @IBOutlet private var applePayView: UIView!
    @IBOutlet private var googlePayView: UIView!

    var presenter: IPaymentMethodPagePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

        creditCardView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(containerViewTapped)))
        payPalView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(containerViewTapped)))
        applePayView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(containerViewTapped)))
        googlePayView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(containerViewTapped)))
    }

    @objc private func containerViewTapped() {
        presenter?.navigateAdress()
    }

    @IBAction private func backButtonClicked(_ sender: Any) {
        presenter?.dismissPage()
    }
}

extension PaymentMethodPageViewController: IPaymentMethodPageViewController { }
