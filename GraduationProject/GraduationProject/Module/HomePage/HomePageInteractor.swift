//
//  HomePageInteractor.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 16.10.2022.
//
//

import Foundation

protocol IHomePageInteractor: AnyObject {
    func fecthAllFoods()
    func searchFood(searchText: String)
}

protocol IHomePageInteractorToPresenter: AnyObject {
    func sendDataToPresenter(dataList: [Yemekler]?)
    func sendSearchDataToPresenter(dataList: [Yemekler]?)
}

class HomePageInteractor: IHomePageInteractor {

    weak var output: IHomePageInteractorToPresenter?

    private let foodListService : ServiceProtocol = Service()

    func fecthAllFoods() {
        foodListService.fetchAllFoods { (models) in
            self.output?.sendDataToPresenter(dataList: models?.yemekler)
        } onError: { (data) in
            print(data)
        }
    }

    func searchFood(searchText: String) {
        foodListService.searchFood(searchText: searchText) { (models) in
            self.output?.sendSearchDataToPresenter(dataList: models?.yemekler?.filter({ $0.yemek_adi!.contains(searchText) }))
        } onError: { (data) in
            print(data)
        }
    }
}
