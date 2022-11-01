//
//  OrderTrackPageInteractor.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 26.10.2022.
//  
//

import Foundation

protocol IOrderTrackPageInteractor: AnyObject {
    // TODO: Declare use case methods
}

protocol IOrderTrackPageInteractorToPresenter: AnyObject {
    // TODO: Declare interactor output methods
}

class OrderTrackPageInteractor {

    // MARK: Properties

    weak var output: IOrderTrackPageInteractorToPresenter?
}

extension OrderTrackPageInteractor: IOrderTrackPageInteractor {
    // TODO: Implement use case methods
}
