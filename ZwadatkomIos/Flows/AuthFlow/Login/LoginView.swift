//
//  LoginView.swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 17/05/2022.
//

import UIKit

class LoginView: UIView {
    
    private var scrollView = UIScrollView(frame: .zero)
    
    
    private var welcomeLabel = UILabel(frame: .zero)
    
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = ColorName.whiteColor.color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
