//
//  OnboardingView.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

class OnboardingView: UIView, ViewCodeContract {
    
    var didTapLogin: (() -> Void)?
    var didTapInsta: (() -> Void)?
    var didTapWebSite: (() -> Void)?
    var didTapSignUp: (() -> Void)?
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.setColor(.whiteStandart)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Viewcode
    
    private var buttonsStackView: UIStackView?
    
    private lazy var topView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.setColor(.whiteStandart)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var headerImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "img_header_onboarding")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var topLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.teenLightFont.withSize(22)
        label.textColor = UIColor.setColor(.blackColor)
        label.text = "Boas-vindas ao"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var markLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.teenBoldFont.withSize(40)
        label.textColor = UIColor.systemGreen
        label.text = "Fin4teen"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionMarkLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.teenMediumFont.withSize(15)
        label.textColor = UIColor.setColor(.grayTeen)
        label.text = "Uma plataforma dedicada para ensinar o melhor do mundo das finanças e investimentos."
        label.numberOfLines = .zero
        label.setLineHeight(lineHeight: 5)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var joinLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.teenMediumFont.withSize(15)
        label.textColor = UIColor.setColor(.grayTeen)
        label.text = "Entre de graça."
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var loginButton: FNTButton = {
        let button = FNTButton(title: "Entrar",
                                font: UIFont.teenSemiBoldFontButton,
                                backgroundColor: UIColor.setColor(.grayLight),
                                textColor: UIColor.setColor(.whiteStandart),
                                accessibilityTitle: "Entrar",
                                action: { [weak self] in
                                    self?.didTapLogin?()
                                })
        button.setTitleColor(UIColor.setColor(.blackColor), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var signUpButton: FNTButton = {
        let button = FNTButton(title: "Crie sua conta",
                                font: UIFont.teenSemiBoldFontButton.withSize(17),
                                backgroundColor: UIColor.setColor(.whiteStandart),
                                textColor: .black,
                                accessibilityTitle: "Crie sua conta.",
                                action: { [weak self] in
                                    self?.didTapSignUp?()
                                })
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var socialMediaLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.teenMediumFont.withSize(14)
        label.textColor = UIColor.setColor(.blackColor)
        label.text = "Nossas redes sociais"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var instagramButton: FTNButtonIcon = {
        let btn = FTNButtonIcon(image: UIImage(named: Image.instagram.rawValue),
                                 backgroundColor: .clear,
                                 colorButton: UIColor.setColor(.blackColor),
                                 accessibility: "Instagram.",
                                 action: { [weak self] in
                                    self?.didTapInsta?()
                                 })
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private lazy var webSiteButton: FTNButtonIcon = {
        let btn = FTNButtonIcon(image: UIImage(named: Image.webSite.rawValue),
                                 backgroundColor: .clear,
                                 colorButton: UIColor.setColor(.blackColor),
                                 accessibility: "Web site.",
                                 action: { [weak self] in
                                    self?.didTapWebSite?()
                                 })
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var mediasView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    // MARK: - Setup viewcode
    
    func setupHierarchy() {
        self.addSubview(topView)
        self.addSubview(loginButton)
        self.addSubview(signUpButton)
        topView.addSubview(topLabel)
        topView.addSubview(markLabel)
        topView.addSubview(descriptionMarkLabel)
        topView.addSubview(joinLabel)
        topView.addSubview(headerImage)
        self.addSubview(mediasView)
        mediasView.addSubview(socialMediaLabel)
        mediasView.addSubview(instagramButton)
        mediasView.addSubview(webSiteButton)
    }
    
    func setupConstraints() {
        
        topView
            .topAnchor(in: self)
            .leftAnchor(in: self)
            .rightAnchor(in: self)
            .heightAnchor(493)
        
        headerImage
            .pin(toEdgesOf: topView)
        
        topLabel
            .topAnchor(in: topView, attribute: .top, padding: 280)
            .leftAnchor(in: topView, padding: 30)
        
        markLabel
            .topAnchor(in: topLabel, attribute: .bottom, padding: 10)
            .leftAnchor(in: topView, padding: 29)
        
        descriptionMarkLabel
            .topAnchor(in: markLabel, attribute: .bottom, padding: 15)
            .leftAnchor(in: topView, padding: 30)
            .widthAnchor(260)
        
        joinLabel
            .topAnchor(in: descriptionMarkLabel, attribute: .bottom, padding: 30)
            .leftAnchor(in: topView, padding: 30)
        
        loginButton
            .topAnchor(in: topView, attribute: .bottom, padding: 40)
            .leftAnchor(in: self, padding: 30)
            .heightAnchor(55)
            .widthAnchor(160)
        
        mediasView
            .topAnchor(in: loginButton, attribute: .bottom, padding: 40)
            .centerX(in: self)
            .heightAnchor(90)
            .widthAnchor(230)
        
        socialMediaLabel
            .topAnchor(in: mediasView, attribute: .top, padding: 2)
            .centerX(in: mediasView)

        instagramButton
            .topAnchor(in: socialMediaLabel, attribute: .bottom, padding: 20)
            .leftAnchor(in: mediasView, padding: 70)
            .heightAnchor(25)
            .widthAnchor(25)

        webSiteButton
            .topAnchor(in: socialMediaLabel, attribute: .bottom, padding: 15)
            .rightAnchor(in: mediasView, padding: 70)
            .heightAnchor(35)
            .widthAnchor(35)
        
        signUpButton
            .topAnchor(in: mediasView, attribute: .bottom)
            .centerX(in: mediasView)
            .heightAnchor(30)
        
    }
    
    func setupConfiguration() {
        /* empty method */
    }
    
    func setup(actionLogin: @escaping Action,
               actionInsta: @escaping Action,
               actionWebSite: @escaping Action,
               actionSignUp: @escaping Action) {
        self.didTapLogin = actionLogin
        self.didTapInsta = actionInsta
        self.didTapWebSite = actionWebSite
        self.didTapSignUp = actionSignUp
    }
    
}
