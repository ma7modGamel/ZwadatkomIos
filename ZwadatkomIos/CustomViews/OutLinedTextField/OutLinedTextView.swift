//
//  OutLinedTextView.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 02/06/2022.
//

import UIKit

class OutLinedTextView: UIView {
    
    private var textField: OutlinedTextField = {
       return OutlinedTextField()
    }()

    private var titleLabel: LabelView = {
        let view = LabelView()
        view.font = UIFont(font: FontFamily.BahijTheSansArabic.semiLight, size: 12)
        view.backgroundColor = ColorName.whiteColor.color
        view.textColor = ColorName.grayColor.color
        view.paddingLeft = 14
        view.paddingRight = 14
        return view
    }()
    
    var text: String? {
        get {
            return textField.text
        }
        set {
            self.textField.text = newValue
        }
    }
    
    var title: String? {
        get {
            return titleLabel.text
        }
        set {
            self.titleLabel.text = newValue
        }
    }

    init(title: String) {
        super.init(frame: .zero)
        self.title = title
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.addSubview(textField)
        self.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            titleLabel.centerYAnchor.constraint(equalTo: textField.topAnchor)
        ])
    }
}
