//
//  TapBarCoordinatorOutput.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 24/05/2022.
//

import Foundation
import Combine

protocol TapBarCoordinatorOutput: AnyObject {
    var onCartIsTapped: PassthroughSubject<Void, Never> { get }
}
