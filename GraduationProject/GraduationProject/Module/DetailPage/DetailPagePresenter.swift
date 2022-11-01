//
//  DetailPagePresenter.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 17.10.2022.
//  
//

import Foundation

protocol IDetailPagePresenter: AnyObject {
    var getFoodPrice: String { get }

    func viewDidLoad()
    func createNewOrder(foodOrderCount: String, userName: String)
    func dismissPage()
}

class DetailPagePresenter: IDetailPagePresenter {

    weak var view: IDetailPageViewController?
    var router: IDetailPageRouter?
    var interactor: IDetailPageInteractor?

    var getFoodPrice: String {
        self.foodPrice
    }

    private let foodID: String 
    private let foodName: String
    private let foodImage: String
    private let foodPrice: String

    init(foodID: String, foodName: String, foodImage: String, foodPrice: String) {
        self.foodID = foodID
        self.foodName = foodName
        self.foodImage = foodImage
        self.foodPrice = foodPrice
    }

    func viewDidLoad() {
        view?.setTitleLabelText(foodName, image: foodImage, price: foodPrice)
    }

    func createNewOrder(foodOrderCount: String, userName: String) {
        interactor?.addNewOrderToBasket(foodName: foodName, foodImage: foodImage, foodPrice: foodPrice, foodOrderCount: foodOrderCount, userName: userName)
    }

    func dismissPage() {
        router?.dismissPage()
    }
}

extension DetailPagePresenter: IDetailPageInteractorToPresenter {
    // TODO: implement interactor output methods
}
