//
//  BasketPagePresenter.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 17.10.2022.
//  
//

import Foundation

protocol IBasketPagePresenter: AnyObject {
    var basketFoodList: [BasketFoodResult] { get }

    func viewDidLoad()
    func getFood(index: Int) -> BasketFoodResult?
    func deleteOrder(sepet_yemek_id: String, kullanici_adi: String)
    func calculate() -> Int
    func deleteAllInBasket()
    func updateOrder(sepet_yemek_id: String, yemek_siparis_adet: String, kullanici_adi: String, yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: String)
    func navigatePaymentMethod()
}

class BasketPagePresenter: IBasketPagePresenter {

    weak var view: IBasketPageViewController?
    var router: IBasketPageRouter?
    var interactor: IBasketPageInteractor?

    var basketFoodList: [BasketFoodResult] = []

    func viewDidLoad() {
        interactor?.fecthBasketFoods(userName: "akolukirik")
    }

    func getFood(index: Int) -> BasketFoodResult? {
        basketFoodList[safe: index]
    }

    func deleteOrder(sepet_yemek_id: String, kullanici_adi: String) {
        interactor?.deleteBasketFood(basketID: sepet_yemek_id, userName: kullanici_adi)
        viewDidLoad()
    }

    func calculate() -> Int {
        var total = 0
        for food in basketFoodList {
            total += Int(food.yemek_siparis_adet!)! * Int(food.yemek_fiyat!)!
        }
        return total
    }

    func deleteAllInBasket() {
        for delete in basketFoodList {
            interactor?.deleteBasketFood(basketID: delete.sepet_yemek_id ?? "",
                                         userName: delete.kullanici_adi ?? "akolukirik")
        }
        viewDidLoad()
    }

    func updateOrder(sepet_yemek_id: String, yemek_siparis_adet: String, kullanici_adi: String, yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: String) {
        
        interactor?.updateBasketFood(basketFoodID: sepet_yemek_id,
                                     foodOrderCount: yemek_siparis_adet,
                                     userName: kullanici_adi,
                                     foodName: yemek_adi,
                                     foodImage: yemek_resim_adi,
                                     foodPrice: yemek_fiyat)
    }

    func navigatePaymentMethod() {
        router?.navigateToPaymentMethodPage()
    }

}

extension BasketPagePresenter: IBasketPageInteractorToPresenter {
    func sendDataToPresenter(dataList: [BasketFoodResult]) {
        let newList = dataList.sorted { $0.yemek_adi ?? "" < $1.yemek_adi ?? "" }
        self.basketFoodList = newList
        view?.reloadTableView()
    }
}
