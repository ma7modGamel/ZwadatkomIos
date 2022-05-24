//
//  NetworkManager.swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 15/05/2022.
//

import Foundation
import Combine
import Moya

class NetworkManager {
    
    private var provider = MoyaProvider<APIRouter>(plugins: [NetworkLoggerPlugin()])
    private static let sharedInstance = NetworkManager()
    
    // Private Init
    private init() {}
    
    class func shared() -> NetworkManager {
        return NetworkManager.sharedInstance
    }
    
    func login(with loginModel: LoginModel) -> Future<AuthResponse, Error>  {
        return request(target: APIRouter.login(loginModel))
    }
    
    func register() -> Future<String, Error> {
        return request(target: APIRouter.register)
    }

    
}

private extension NetworkManager {
    private func request<T: Decodable>(target: APIRouter) -> Future<T, Error>  {
        return Future { [weak self] promise in
            guard let self = self else { return }
            self.provider.request(target) { result in
                switch result {
                case .success(let response):
                     try! print(response.mapString())
                    do {
                        try promise(.success(response.map(T.self)))
                    } catch {
                        promise(.failure(error))
                    }
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
    }
}
