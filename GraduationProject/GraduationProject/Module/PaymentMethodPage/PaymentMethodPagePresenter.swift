//
//  PaymentMethodPagePresenter.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 26.10.2022.
//  
//

import Foundation

protocol IPaymentMethodPagePresenter: AnyObject {
    func navigateAdress()
    func dismissPage()
}

class PaymentMethodPagePresenter {
    weak var view: IPaymentMethodPageViewController?
    var router: IPaymentMethodPageRouter?
    var interactor: IPaymentMethodPageInteractor?
}

extension PaymentMethodPagePresenter: IPaymentMethodPagePresenter {
    func dismissPage() {
        router?.dismissPage()
    }

    func navigateAdress() {
        router?.navigateToAdressPage()
    }
}

extension PaymentMethodPagePresenter: IPaymentMethodPageInteractorToPresenter {

}
