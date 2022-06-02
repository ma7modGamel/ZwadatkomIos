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
    
    private static let basicAuthPlugin = AccessTokenPlugin { _ in
        guard let token = UserDefaultsManager.shared().token else { return "" }
        return token
    }
    // [NetworkLoggerPlugin()
    private var provider = MoyaProvider<APIRouter>(plugins: [basicAuthPlugin])
    private static let sharedInstance = NetworkManager()
    
    // Private Init
    private init() {}
    
    class func shared() -> NetworkManager {
        return NetworkManager.sharedInstance
    }
    
    func login(with loginModel: LoginModel) -> Future<AuthResponse, Error>  {
        return request(target: APIRouter.login(loginModel))
    }
    
    func getUserInformations() -> Future<UserMainResponse, Error> {
        return request(target: APIRouter.userInformations)
    }
    
    func register() -> Future<String, Error> {
        return request(target: APIRouter.register)
    }
    
    func getBanners() -> Future<BannerMainResponse, Error> {
        return request(target: APIRouter.getBanners)
    }
    
    func getCategories() -> Future<CategoriesMainResponse, Error> {
        return request(target: APIRouter.getCategories)
    }
    
    func getProducts(inCategory id: Int = 0) -> Future<ProductsMainResponse, Error> {
        return request(target: APIRouter.getProducts(categoryId: [id]))
    }
}

private extension NetworkManager {
    private func request<T: Decodable>(target: APIRouter) -> Future<T, Error>  {
        return Future { [weak self] promise in
            guard let self = self else { return }
            self.provider.request(target) { result in
                switch result {
                case .success(let response):
                     //try! print(response.mapString())
                    do {
                        try promise(.success(response.map(T.self)))
                    } catch {
                        promise(.failure(error))
                        print(error)
                    }
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
    }
}
