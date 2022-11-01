//
//  DetailPageInteractor.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 17.10.2022.
//  
//

import Foundation
import Alamofire

protocol IDetailPageInteractor: AnyObject {
    func addNewOrderToBasket(foodName: String, foodImage: String, foodPrice: String, foodOrderCount: String, userName:String)
}

protocol IDetailPageInteractorToPresenter: AnyObject {
    
}

class DetailPageInteractor: IDetailPageInteractor {

    weak var output: IDetailPageInteractorToPresenter?

    private let foodService : ServiceProtocol = Service()

    func addNewOrderToBasket(foodName: String, foodImage: String, foodPrice: String, foodOrderCount: String, userName: String) {

       foodService.addNewOrder(foodName: foodName,
                                foodImage: foodImage,
                                foodPrice: foodPrice,
                                foodOrderCount: foodOrderCount,
                                userName: "akolukirik") { (models) in
        } onError: { data in
            print(data.localizedDescription)
        }
    }
}
