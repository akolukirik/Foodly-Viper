//
//  PaymentMethodPageInteractor.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 26.10.2022.
//  
//

import Foundation

protocol IPaymentMethodPageInteractor: AnyObject {
    // TODO: Declare use case methods
}

protocol IPaymentMethodPageInteractorToPresenter: AnyObject {
    // TODO: Declare interactor output methods
}

class PaymentMethodPageInteractor {

    // MARK: Properties

    weak var output: IPaymentMethodPageInteractorToPresenter?
}

extension PaymentMethodPageInteractor: IPaymentMethodPageInteractor {
    // TODO: Implement use case methods
}
