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
    case getBanners
}

extension APIRouter: TargetType, AccessTokenAuthorizable {
    
    var authorizationType: AuthorizationType? {
        switch self {
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
        case .getBanners:
            return URLs.banners
        }
    }
    
    public var method: Moya.Method {
        switch self {

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
        default:
            return .requestPlain
        }
    }
    

    public var headers: [String : String]? {
        let headers = [
            HeaderKeys.contentType: "application/json",
            HeaderKeys.accept: "application/json"
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
