//
//  RecoveryPassView.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

class RecoveryPassView: UIView, ViewCodeContract {
    
    var didTapClose: (() -> Void)?
    var didTapSendRecovery: (() -> Void)?
    
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
                                    accessibility: "Fechar",
                                    action: { [weak self] in
                                        self?.didTapClose?()
                                    })
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Recupere sua senha."
        label.font = UIFont.teenSemiBoldFontButton.withSize(30)
        label.textColor = UIColor.setColor(color: .blackColor)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email cadastrado"
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

    private lazy var loginButton: FNTButton = {
        let button = FNTButton(title: "Enviar",
                                font: UIFont.teenSemiBoldFontButton,
                                backgroundColor: UIColor.setColor(color: .blackColor),
                                textColor: UIColor.setColor(color: .whiteStandart),
                                accessibilityTitle: "Enviar",
                                action: { [weak self] in
                                    print("enviar tapped")
                                    self?.didTapSendRecovery?()
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
        self.addSubview(loginButton)
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
        
        loginButton
            .topAnchor(in: emailTextfield, attribute: .bottom, padding: 30)
            .leftAnchor(in: self, padding: 30)
            .rightAnchor(in: self, padding: 30)
            .heightAnchor(50)
        
    }
    
    func setupConfiguration() {
        self.backgroundColor = UIColor.setColor(color: .whiteStandart)
        setupTextField()
    }
    
    private func setupTextField() {
        emailTextfield.delegate = self
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                 action: #selector(self.dismissKeyboard))
        self.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        emailTextfield.resignFirstResponder()
        self.endEditing(true)
    }
    
    func setup(closeAction: @escaping Action,
               sendRecovery: @escaping Action) {
        self.didTapClose = closeAction
        self.didTapSendRecovery = sendRecovery
    }
    
}

// MARK: - Extensions

extension RecoveryPassView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextfield.resignFirstResponder()
    }
    
}
