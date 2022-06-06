//
//  APIRouter.swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 15/05/2022.
//

import Foundation
import Moya

enum APIRouter {
    case login(_ loginModel: LoginModel)
    case register
    case userInformations
    case getBanners
    case getCategories
    case getProducts(categoryId: [Int]?)
    case getOrders
    case getOrder(orderId: Int)
}

extension APIRouter: TargetType, AccessTokenAuthorizable {
    
    var authorizationType: AuthorizationType? {
        switch self {
        case .userInformations:
            return .bearer
        case .getBanners, .getCategories, .getProducts, .getOrders, .getOrder:
            return .bearer
        default:
            return .none
        }
    }
    
    public var baseURL: URL {
        guard let baseURL = URL(string: URLs.baseURL) else { fatalError() }
        return baseURL
    }
    
    public var path: String {
        switch self {
        case .login:
            return URLs.login
        case .register:
            return URLs.register
        case .userInformations:
            return URLs.userInformations
        case .getBanners:
            return URLs.banners
        case .getCategories:
            return URLs.categories
        case .getProducts:
            return URLs.products
        case .getOrders:
            return URLs.orders
        case .getOrder(let orderId):
            return URLs.order.appending(String(orderId))
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case.userInformations, .getBanners, .getCategories, .getProducts :
            return .get
        default:
            return .post
        }
    }
    
    public var task: Task {
        switch self {
        case .register:
            return .requestPlain
        case .login(let loginModel):
            let body = try! toDictionary(model: loginModel)
            return .requestParameters(parameters: body, encoding: JSONEncoding.default)
        case .getProducts(let categoryId):
            guard let categoryId = categoryId else { return .requestPlain }
            return .requestParameters(parameters: ["categories" : [categoryId]], encoding: URLEncoding.queryString)
        default:
            return .requestPlain
        }
    }
    

    public var headers: [String : String]? {
        let headers = [
            HeaderKeys.contentType: "application/json",
            HeaderKeys.accept: "application/json",
            "Accept-Language": "ar"
        ]
        return headers
    }
    
}
extension APIRouter {
    private func toDictionary <T: Encodable> (model: T) throws -> [String: Any] {
        let data = try JSONEncoder().encode(model)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
            return dictionary
    }
}
