//
//  SignUpView.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

class SignUpView: UIView, ViewCodeContract {
    
    var didTapClose: (() -> Void)?
    var didTapSignUp: (() -> Void)?
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Viewcode
    
    private lazy var closeButton: FTNButtonIcon = {
        let button = FTNButtonIcon(image: UIImage(named: Image.close.rawValue),
                                    backgroundColor: UIColor.clear,
                                   colorButton: UIColor.black,
                                    accessibility: "Fechar",
                                    action: { [weak self] in
                                        self?.didTapClose?()
                                    })
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Crie a sua conta."
        label.font = UIFont.teenSemiBoldFontButton.withSize(30)
        label.textColor = UIColor.setColor(.blackColor)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.font = UIFont.teenMediumFont.withSize(18)
        label.textColor = UIColor.setColor(.blackColor)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Senha"
        label.font = UIFont.teenMediumFont.withSize(18)
        label.textColor = UIColor.setColor(.blackColor)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var passwordConfirmLabel: UILabel = {
        let label = UILabel()
        label.text = "Confirme sua senha"
        label.font = UIFont.teenMediumFont.withSize(18)
        label.textColor = UIColor.setColor(.blackColor)
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
    
    private lazy var passwordConfirmTextfield: FTNTextField = {
        let txtf = FTNTextField()
        txtf.isSecureTextEntry = true
        txtf.autocorrectionType = .no
        txtf.placeholder = "********"
        txtf.translatesAutoresizingMaskIntoConstraints = false
        txtf.returnKeyType = .go
        return txtf
    }()
    
    private lazy var loginButton: FNTButton = {
        let button = FNTButton(title: "Criar conta",
                                font: UIFont.teenSemiBoldFontButton,
                                backgroundColor: UIColor.setColor(.blackColor),
                                textColor: UIColor.setColor(.whiteStandart),
                                accessibilityTitle: "Login",
                                action: { [weak self] in
                                    print("entrar tapped")
                                    
                                })
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Setup viewcode
    
    func setupHierarchy() {
        self.addSubview(closeButton)
        self.addSubview(titleLabel)
        self.addSubview(emailLabel)
        self.addSubview(emailTextfield)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextfield)
        self.addSubview(loginButton)
        self.addSubview(passwordConfirmLabel)
        self.addSubview(passwordConfirmTextfield)
    }
    
    func setupConstraints() {
        
        closeButton
            .topAnchor(in: self, padding: 40)
            .rightAnchor(in: self, padding: 30)
            .heightAnchor(15)
            .widthAnchor(15)
        
        titleLabel
            .topAnchor(in: self, padding: 200)
            .leftAnchor(in: self, padding: 30)
        
        emailLabel
            .topAnchor(in: titleLabel, attribute: .bottom, padding: 40)
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
        
        passwordConfirmLabel
            .topAnchor(in: passwordTextfield, attribute: .bottom, padding: 20)
            .leftAnchor(in: self, padding: 30)
        
        passwordConfirmTextfield
            .topAnchor(in: passwordConfirmLabel, attribute: .bottom, padding: 7)
            .leftAnchor(in: self, padding: 30)
            .rightAnchor(in: self, padding: 30)
            .heightAnchor(50)
        
        loginButton
            .topAnchor(in: passwordConfirmTextfield, attribute: .bottom, padding: 50)
            .leftAnchor(in: self, padding: 30)
            .rightAnchor(in: self, padding: 30)
            .heightAnchor(60)
 
    }
    
    func setupConfiguration() {
        self.backgroundColor = UIColor.setColor(.whiteStandart)
        setupTextField()
    }
    
    private func setupTextField() {
        emailTextfield.delegate = self
        passwordTextfield.delegate = self
        passwordConfirmTextfield.delegate = self
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                 action: #selector(self.dismissKeyboard))
        self.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        emailTextfield.resignFirstResponder()
        self.endEditing(true)
    }
    
    func setup(didTapClose: @escaping Action,
               didTapSignUp: @escaping Action) {
        
        self.didTapClose = didTapClose
        self.didTapSignUp = didTapSignUp
    }
    
}

// MARK: - Extensions

extension SignUpView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordTextfield.resignFirstResponder()
    }
    
}
