//
//  HomeModuleFactory.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 25/05/2022.
//

import Foundation

protocol HomeModuleFactory {
    func createHomeOutput() -> HomeControllerProtocol
}
