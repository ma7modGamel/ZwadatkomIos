//
//  SettingsModuleFactory.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 25/05/2022.
//

import Foundation

protocol SettingsModuleFactory {
    func createSettingsOutput() -> SettingsController
    func createPersonalInformationHandler() -> PersonalInformationControllerProtocol
    func createOrdersHandler() -> OrdersControllerProtocol
    func createOrderDetailsHandler(for orderId: Int) -> OrderDetailsControllerProtocol
}
