//
//  OnboardingView.swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 16/05/2022.
//

import UIKit
import Combine

class OnboardingView: UIView {

    typealias OnboardingValue = (imageAsset: ImageAsset, title: String, content: String)
    
    var currentViewValuePublisher = PassthroughSubject<OnboardingValue, Never>()
    
    var nextButton = UIButton(frame: .zero)
    private var nextContainer = UIView(frame: .zero)
    private var circleShape = CAShapeLayer()

    private var currentValueSubscription: AnyCancellable?
    private var centerIndicator = UIView()
    private var welcomeImageView = UIImageView(frame: .zero)
    private var welcomeTitle = UILabel(frame: .zero)
    private var welcomeContent = UILabel(frame: .zero)
    
    private var itemPadding: CGFloat = 20
    
    init() {
        super.init(frame: .zero)
        backgroundColor = ColorName.whiteColor.color
        configureCircleShape()

        setCurrentValuePublisherPipeLine()
        configureTitleLabel()
        configureContentLabel()
        configureWelcomeImageView()
        configureNextButton()
        layoutUI()
        
        self.layer.addSublayer(circleShape)
    }
    
    override func layoutSubviews() {
        print("start layout Subviews")
        super.layoutSubviews()
        layoutNextButtonContainer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setCurrentValuePublisherPipeLine() {
        currentValueSubscription = currentViewValuePublisher.sink { [weak self] currentValue in
            guard let self = self else { return }
            self.animateButtonCircle()
            self.imageTransitionEffect(with: currentValue)
        }
    }
    
    private func configureTitleLabel() {
        welcomeTitle.font = UIFont(font: FontFamily.BahijTheSansArabic.semiBold, size: 28)
        welcomeTitle.textAlignment = .center
    }
    
    private func configureContentLabel() {
        welcomeContent.font = UIFont(font: FontFamily.TheSansArabic.light, size: 12)
        welcomeContent.textColor = ColorName.grayColor.color
        welcomeContent.numberOfLines = 0
        welcomeContent.textAlignment = .center
    }
    
    private func configureWelcomeImageView() {
        welcomeImageView.image = UIImage()
        welcomeImageView.contentMode = .scaleAspectFit
    }
    
    private func configureNextButton() {
        let image = UIImage(named: Asset.nextButton.name)
        nextButton.setImage(image, for: .normal)
        
    }
    
    private func configureCircleShape() {
        circleShape.strokeColor = ColorName.greenColor.color.cgColor
        circleShape.fillColor = UIColor.clear.cgColor
        circleShape.strokeEnd = 0
    }

}

extension OnboardingView {
    
    private func layoutUI() {
        layoutCenterIndicator()
        layoutWelcomeImageView()
        layoutWelcomeTitle()
        layoutContentLabel()
        layoutNextButtonContainer()
        
    }
    
    private func layoutCenterIndicator() {
        addSubview(centerIndicator)
        centerIndicator.anchorCenterSuperview()
    }
    
    private func layoutWelcomeTitle() {
        addSubview(welcomeTitle)
        welcomeTitle.anchor(top: centerIndicator.bottomAnchor,
                            left: leftAnchor,
                            right: rightAnchor,
                            topConstant: itemPadding)
    }
    
    private func layoutContentLabel() {
        addSubview(welcomeContent)
        welcomeContent.anchor(top: welcomeTitle.bottomAnchor,
                              left: leftAnchor,
                              right: rightAnchor,
                              topConstant: itemPadding,
                              leftConstant: 70,
                              rightConstant: 70)
    }
    
    private func layoutWelcomeImageView() {
        addSubview(welcomeImageView)
        welcomeImageView.anchor(bottom: centerIndicator.topAnchor,
                                bottomConstant: itemPadding)
        welcomeImageView.anchorCenterXToSuperview()
    }
    
    private func layoutNextButtonContainer() {
        addSubview(nextContainer)
        nextContainer.anchor(bottom: bottomAnchor, bottomConstant: 70, widthConstant: 75, heightConstant: 75)
        nextContainer.anchorCenterXToSuperview()
        nextContainer.addSubview(nextButton)
        nextButton.anchorCenterSuperview()
        
        
        let lineWidth: CGFloat = 18
        let endAngle: CGFloat = (.pi * 2)
        let startAngle: CGFloat = -(.pi / 2)
        
        let arcCenter = CGPoint(x: nextContainer.bounds.midX, y: nextContainer.bounds.midY)
        let radius = (min(nextContainer.bounds.width, nextContainer.bounds.height) - lineWidth) / 2
        
        let path = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        circleShape.path = path.cgPath
        nextContainer.layer.addSublayer(circleShape)
    }
    
    private func animateButtonCircle() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        let toValue: CGFloat = (1 / 3)
        animation.toValue = toValue
        animation.duration = 1.5
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        circleShape.add(animation, forKey: "animation")
    }
    
    private func imageTransitionEffect(with value: OnboardingValue) {
        UIView.transition(with:  welcomeImageView, duration: 0.75, options: .transitionCrossDissolve) {
            let image = UIImage(asset: value.imageAsset)
            self.welcomeImageView.image = image
        }
        
        UIView.transition(with: self.welcomeTitle, duration: 0.75, options: .transitionCrossDissolve) {
            self.welcomeTitle.text = value.title
            
        }
        
        UIView.transition(with: self.welcomeContent, duration: 0.75, options: .transitionCrossDissolve) {
            self.welcomeContent.text = value.content
            
        }
        
    }
}
