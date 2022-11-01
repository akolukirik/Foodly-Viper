//
//  BaseEndPointRouter.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 30.10.2022.
//

import Foundation
import Alamofire

public protocol BaseEndPointRouter: URLRequestConvertible {
    /// Returns a `URLRequest` or throws if an `Error` was encountered.
    ///
    /// - Returns: A `URLRequest`.
    /// - Throws:  Any error thrown while constructing the `URLRequest`.
    func asURLRequest() throws -> URLRequest
}
