//
//  LoginView.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

class LoginView: UIView, ViewCodeContract {
    
    var didTapRecoveryPass: (() -> Void)?
    var didTapClose: (() -> Void)?
    var didTapLogin: (() -> Void)?
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Viewcode
    
    private lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var headerImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "img_header_onboarding")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var closeButton: FTNButtonIcon = {
        let button = FTNButtonIcon(image: UIImage(named: Image.close.rawValue),
                                    backgroundColor: UIColor.clear,
                                    colorButton: UIColor.setColor(color: .blackColor),
                                    accessibility: "Fechar",
                                    action: { [weak self] in
                                        self?.didTapClose?()
                                    })
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.font = UIFont.teenMediumFont.withSize(18)
        label.textColor = UIColor.setColor(color: .blackColor)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Senha"
        label.font = UIFont.teenMediumFont.withSize(18)
        label.textColor = UIColor.setColor(color: .blackColor)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emailTextfield: FTNTextField = {
        let txtf = FTNTextField()
        txtf.keyboardType = .emailAddress
        txtf.autocorrectionType = .no
        txtf.placeholder = "usuario@email.com"
        txtf.translatesAutoresizingMaskIntoConstraints = false
        return txtf
    }()
    
    private lazy var passwordTextfield: FTNTextField = {
        let txtf = FTNTextField()
        txtf.isSecureTextEntry = true
        txtf.autocorrectionType = .no
        txtf.placeholder = "********"
        txtf.translatesAutoresizingMaskIntoConstraints = false
        txtf.returnKeyType = .go
        return txtf
    }()
    
    private lazy var loginButton: FNTButton = {
        let button = FNTButton(title: "Entrar",
                                font: UIFont.teenSemiBoldFontButton,
                                backgroundColor: UIColor.setColor(color: .blackColor),
                                textColor: UIColor.setColor(color: .whiteStandart),
                                accessibilityTitle: "Login",
                                action: { [weak self] in
                                    print("entrar tapped")
                                    self?.didTapLogin?()
                                })
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var recoveryPassLabel: FTNViewAction = {
        let button = FTNViewAction()
        button.setup(title: "Esqueceu a senha?",
                     backgroundColor: .clear,
                     action: { [weak self] in
                        self?.didTapRecoveryPass?()
                     })
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var markLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.teenBoldFont.withSize(40)
        label.textColor = UIColor.systemGreen
        label.text = "Fin4teen"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Setup viewcode
    
    func setupHierarchy() {
        headerView.addSubview(emailLabel)
        headerView.addSubview(emailTextfield)
        headerView.addSubview(passwordLabel)
        headerView.addSubview(passwordTextfield)
        self.addSubview(loginButton)
        self.addSubview(recoveryPassLabel)
        self.addSubview(headerView)
        headerView.addSubview(headerImage)
        headerView.addSubview(closeButton)
        headerView.addSubview(markLabel)
    }
    
    func setupConstraints() {
        
        headerView
            .topAnchor(in: self)
            .leftAnchor(in: self)
            .rightAnchor(in: self)
            .heightAnchor(493)
        
        headerImage
            .pin(toEdgesOf: headerView)
        
        markLabel
            .centerX(in: headerView)
            .topAnchor(in: headerView, padding: 110)
        
        closeButton
            .topAnchor(in: headerView, padding: 40)
            .rightAnchor(in: headerView, padding: 30)
            .heightAnchor(15)
            .widthAnchor(15)
      
        emailLabel
            .topAnchor(in: markLabel, attribute: .bottom, padding: 130)
            .leftAnchor(in: self, padding: 30)
        
        emailTextfield
            .topAnchor(in: emailLabel, attribute: .bottom, padding: 7)
            .leftAnchor(in: self, padding: 30)
            .rightAnchor(in: self, padding: 30)
            .heightAnchor(50)
        
        passwordLabel
            .topAnchor(in: emailTextfield, attribute: .bottom, padding: 20)
            .leftAnchor(in: self, padding: 30)
        
        passwordTextfield
            .topAnchor(in: passwordLabel, attribute: .bottom, padding: 7)
            .leftAnchor(in: self, padding: 30)
            .rightAnchor(in: self, padding: 30)
            .heightAnchor(50)
        
        loginButton
            .topAnchor(in: passwordTextfield, attribute: .bottom, padding: 50)
            .leftAnchor(in: self, padding: 30)
            .rightAnchor(in: self, padding: 30)
            .heightAnchor(60)
        
        recoveryPassLabel
            .centerX(in: loginButton)
            .topAnchor(in: loginButton, attribute: .bottom, padding: 13)
            .widthAnchor(200)
            .heightAnchor(20)
    }
    
    func setupConfiguration() {
        self.backgroundColor = UIColor.setColor(color: .whiteStandart)
    }
    
    private func setupTextField() {
        emailTextfield.delegate = self
        passwordTextfield.delegate = self
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                 action: #selector(self.dismissKeyboard))
        self.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        emailTextfield.resignFirstResponder()
        self.endEditing(true)
    }
    
    func setup(recoveryPassAction: @escaping Action,
               didTapClose: @escaping Action,
               didTapLogin: @escaping Action) {
        self.didTapRecoveryPass = recoveryPassAction
        self.didTapClose = didTapClose
        self.didTapLogin = didTapLogin
    }
    
}

// MARK: - Extensions
extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordTextfield.resignFirstResponder()
    }
    
}
