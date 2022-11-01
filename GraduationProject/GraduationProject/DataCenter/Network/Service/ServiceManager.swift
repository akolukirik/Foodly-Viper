//
//  ServiceManager.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 28.10.2022.
//

import Foundation
import Alamofire

final class ServiceManager: NSObject {
    public static let shared: ServiceManager = ServiceManager()

    fileprivate var session = AF

    private override init() {
        super.init()
        session = Session()
    }
}

extension ServiceManager {
    @discardableResult
    func performRequest<T: Decodable>(endpoint: BaseEndPointRouter,
                                      decoder: DataDecoder = JSONDecoder(),
                                      onSuccess: @escaping (T?) -> Void,
                                      onError: @escaping (AFError) -> Void) -> DataRequest {
        return session.request(endpoint)
            .validate(statusCode: 200..<400)
            .validate(contentType: ["text/html"])
            .responseDecodable(of: T.self) { (requestResponse) in
                switch requestResponse.result {
                case .success:
                    onSuccess(requestResponse.value)
                case .failure(let error):
                    onError(error)
                }
            }
    }
}
