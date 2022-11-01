//
//  BasketPageInteractor.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 17.10.2022.
//  
//

import Foundation
import Alamofire

protocol IBasketPageInteractor: AnyObject {
    func fecthBasketFoods(userName: String)
    func deleteBasketFood(basketID: String, userName:String)
    func updateBasketFood(basketFoodID: String, foodOrderCount: String ,userName:String, foodName: String, foodImage: String, foodPrice: String)
}

protocol IBasketPageInteractorToPresenter: AnyObject {
    func sendDataToPresenter(dataList: [BasketFoodResult])
}

class BasketPageInteractor: IBasketPageInteractor {

    weak var output: IBasketPageInteractorToPresenter?

    private let basketFoodService: ServiceProtocol = Service()

    func fecthBasketFoods(userName: String) {
        basketFoodService.fetchAllBasketFoods(userName: userName) { (model) in
            self.output?.sendDataToPresenter(dataList: model?.sepet_yemekler ?? [] )
        } onError: { error in
            self.output?.sendDataToPresenter(dataList: [])
        }
    }

    func deleteBasketFood(basketID: String, userName:String) {
        basketFoodService.deleteBasketFood(basketID: basketID, userName: userName) { model in
            self.fecthBasketFoods(userName: "akolukirik")
        } onError: { error in
            print(error.localizedDescription)
        }
    }

    func updateBasketFood(basketFoodID: String, foodOrderCount: String, userName: String, foodName: String, foodImage: String, foodPrice: String) {
        
        deleteBasketFood(basketID: basketFoodID, userName: userName)

        let newOrder = (Int(foodOrderCount) ?? 1)

        basketFoodService.addNewOrder(foodName: foodName,
                                      foodImage: foodImage,
                                      foodPrice: foodPrice,
                                      foodOrderCount: String(newOrder),
                                      userName: userName) { (model) in
            self.fecthBasketFoods(userName: "akolukirik")
        } onError: { error in
            print(error)
        }
    }
}
