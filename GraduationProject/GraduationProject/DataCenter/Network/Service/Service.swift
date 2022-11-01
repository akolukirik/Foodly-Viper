//
//  Service.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 28.10.2022.
//

import Foundation
import Alamofire

protocol ServiceProtocol {
    func fetchAllFoods(onSuccess: @escaping (FoodsResponse?) -> Void, onError: @escaping (AFError) -> Void)
    func searchFood(searchText: String, onSuccess: @escaping (FoodsResponse?) -> Void, onError: @escaping (AFError) -> Void)
    func fetchAllBasketFoods(userName: String, onSuccess: @escaping (BasketFoodResponse?) -> Void, onError: @escaping (AFError) -> Void)
    func deleteBasketFood(basketID: String, userName: String, onSuccess: @escaping (BasketFoodResult?) -> Void, onError: @escaping (AFError) -> Void)
    func addNewOrder(foodName: String, foodImage: String, foodPrice: String, foodOrderCount: String, userName: String, onSuccess: @escaping (BasketFoodResponse?) -> Void, onError: @escaping (AFError) -> Void)
}

//MARK: - Service
final class Service: ServiceProtocol {
    func fetchAllFoods(onSuccess: @escaping (FoodsResponse?) -> Void, onError: @escaping (Alamofire.AFError) -> Void) {
        ServiceManager.shared.performRequest(endpoint: SimpleEndPointRouter.allFoods) { (response: FoodsResponse?) in
            onSuccess(response)
        } onError: { error in
            onError(error)
        }

    }

    func searchFood(searchText: String, onSuccess: @escaping (FoodsResponse?) -> Void, onError: @escaping (Alamofire.AFError) -> Void) {
        ServiceManager.shared.performRequest(endpoint: SimpleEndPointRouter.searchFoods(searchText: searchText)) { (response: FoodsResponse?) in
            onSuccess(response)
        } onError: { error in
            onError(error)
        }

    }

    func addNewOrder(foodName: String, foodImage: String, foodPrice: String, foodOrderCount: String, userName: String, onSuccess: @escaping (BasketFoodResponse?) -> Void, onError: @escaping (Alamofire.AFError) -> Void) {
        ServiceManager.shared.performRequest(endpoint: SimpleEndPointRouter.addNewFood(foodName: foodName,
                                                                                       foodImage: foodImage,
                                                                                       foodPrice: foodPrice,
                                                                                       foodOrderCount: foodOrderCount,
                                                                                       userName: userName)) { (response: BasketFoodResponse?) in
            onSuccess(response!)
        } onError: { error in
            onError(error)
        }

    }

    func fetchAllBasketFoods(userName: String, onSuccess: @escaping (BasketFoodResponse?) -> Void, onError: @escaping (Alamofire.AFError) -> Void) {
        ServiceManager.shared.performRequest(endpoint: SimpleEndPointRouter.allBasketFoods(userName: userName)) { (response: BasketFoodResponse?) in
            onSuccess(response)
        } onError: { error in
            onError(error)
        }
    }

    func deleteBasketFood(basketID: String, userName: String, onSuccess: @escaping (BasketFoodResult?) -> Void, onError: @escaping (Alamofire.AFError) -> Void) {
        ServiceManager.shared.performRequest(endpoint: SimpleEndPointRouter.deleteBasketFood(basketID: basketID, userName: userName)) {(response: BasketFoodResult?) in
            onSuccess(response)
        } onError: { error in
            onError(error)
        }
    }
}
