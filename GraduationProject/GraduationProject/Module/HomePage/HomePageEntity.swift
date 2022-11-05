//
//  HomePageEntity.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 16.10.2022.
//

import Foundation

struct FoodsResponse : Decodable {
    var yemekler: [Yemekler]?
    var success: Int?
}

struct Yemekler: Decodable {
    let yemek_id: String?
    let yemek_adi: String?
    let yemek_resim_adi: String?
    let yemek_fiyat: String?

    enum CodingKeys: CodingKey {
        case yemek_id
        case yemek_adi
        case yemek_resim_adi
        case yemek_fiyat
    }

    init(yemek_id: String, yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: String) {
        self.yemek_id = yemek_id
        self.yemek_adi = yemek_adi
        self.yemek_resim_adi = yemek_resim_adi
        self.yemek_fiyat = yemek_fiyat
    }
}
