//
//  SimpleEndPointRouter.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 30.10.2022.
//

import Foundation
import Alamofire

extension SimpleEndPointRouter {
    private enum Constants {

        enum BaseUrl {
            static let baseUrl = "http://kasimadalan.pe.hu/yemekler"
        }
        
    }
}

enum SimpleEndPointRouter: BaseEndPointRouter {
    case allFoods
    case searchFoods(searchText: String)
    case addNewFood(foodName: String, foodImage: String, foodPrice: String, foodOrderCount: String, userName: String)
    case allBasketFoods(userName: String)
    case deleteBasketFood(basketID: String, userName: String)
    case test

    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .allFoods:
            return .get
        case .searchFoods:
            return .post
        case .allBasketFoods:
            return .post
        case .deleteBasketFood:
            return .post
        case .addNewFood:
            return .post
        default:
            return .post
        }
    }

    // MARK: - Path
    var path: String {
        switch self {
        case .allFoods: return "/tumYemekleriGetir.php"
        case .searchFoods: return "/tumYemekleriGetir.php"
        case .allBasketFoods: return "/sepettekiYemekleriGetir.php"
        case .deleteBasketFood: return "/sepettenYemekSil.php"
        case .addNewFood: return "/sepeteYemekEkle.php"
        default:
            return ""
        }
    }

    // MARK: - baseURL
    private var baseURL: String {
        switch self {
        case .allFoods, .searchFoods, .allBasketFoods, .deleteBasketFood:
            return Constants.BaseUrl.baseUrl
        case .addNewFood:
            return Constants.BaseUrl.baseUrl
        default:
            return ""
        }
    }

    // MARK: - ParameterEncoding
    private var encoder: ParameterEncoding {
        if self.method == HTTPMethod.get {
            return URLEncoding()
        } else if  self.method == HTTPMethod.post {
            return URLEncoding()
        }
        else {
            return JSONEncoding()
        }
    }

    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .searchFoods(let searchText):
            return ["yemek_adi": searchText]
        case .allBasketFoods(let userName):
            return ["kullanici_adi": userName]
        case .deleteBasketFood(let basketID, let userName):
            return ["sepet_yemek_id": basketID,
                    "kullanici_adi": userName]
        case .addNewFood(let foodName, let foodImage, let foodPrice, let foodOrderCount, let userName):
            return ["yemek_adi": foodName,
                    "yemek_resim_adi": foodImage,
                    "yemek_fiyat": foodPrice,
                    "yemek_siparis_adet": foodOrderCount,
                    "kullanici_adi": userName]
        default:
            return nil
        }
    }

    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {

        // Request URL
        let url = try baseURL.asURL().appendingPathComponent(path).absoluteString.removingPercentEncoding!.asURL()
        var urlRequest = URLRequest(url: url)

        // HTTP Method
        urlRequest.httpMethod = method.rawValue

        // Headers
//        let jsonHeader = "text/html"
//        urlRequest.headers.add(.accept(jsonHeader))
//        urlRequest.headers.add(.contentType(jsonHeader))

        do {
            urlRequest = try encoder.encode(urlRequest, with: parameters)
        } catch {
            throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
        }
        return urlRequest
    }

    private func queryString(_ value: String, params: Parameters) -> URL? {
        var components = URLComponents(string: value)
        components?.queryItems = params.map { element in
            URLQueryItem(name: element.key,
                         value: element.value as? String)
        }
        return components?.url
    }
}

