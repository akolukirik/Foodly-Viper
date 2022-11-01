//
//  AdressPageViewController.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 26.10.2022.
//  
//

import Foundation
import UIKit

protocol IAdressPageViewController: IBaseView {

}

class AdressPageViewController: BaseViewController, StoryboardLoadable {

    @IBOutlet private var homeView: UIView!
    @IBOutlet private var officeView: UIView!

    var presenter: IAdressPagePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

        homeView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                             action: #selector(containerViewTapped)))
        officeView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                               action: #selector(containerViewTapped)))
    }

    @objc private func containerViewTapped() {
        presenter?.navigateCheckOutPage()
    }

    @IBAction private func backButtonClicked(_ sender: Any) { 
        presenter?.dismissPage()
    }
}

extension AdressPageViewController: IAdressPageViewController {

}
