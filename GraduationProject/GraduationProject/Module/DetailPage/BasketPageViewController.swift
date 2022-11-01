//
//  BasketPageViewController.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 17.10.2022.
//  
//

import Foundation
import UIKit

protocol IBasketPageViewController: IBaseView {
    // TODO: Declare view methods
}

class BasketPageViewController: BaseViewController, StoryboardLoadable {

    // MARK: Properties

    var presenter: IBasketPagePresenter?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension BasketPageViewController: IBasketPageViewController {
    // TODO: implement view output methods
}
