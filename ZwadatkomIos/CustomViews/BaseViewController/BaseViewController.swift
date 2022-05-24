//
//  BaseViewController.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 23/05/2022.
//

import UIKit
import Combine

class BaseUIViewController: UIViewController {

    internal var baseView: BaseUIView!
    internal var subscriptions = Set<AnyCancellable>()

    override func loadView() {
        super.loadView()
        let baseView = BaseUIView()
        self.baseView = baseView
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("BaseUIViewController super view did load")
        bindToBackButtonTap()
        self.navigationController?.isNavigationBarHidden = true
    }

    private func bindToBackButtonTap() {
        baseView.backButton.tapPublisher.sink { [weak self] _ in
            guard let self = self else { return }
            print("back back button pressed, going to pop this controller \(self.description)")
            self.navigationController?.popViewController()
        }.store(in: &subscriptions)
    }
}
