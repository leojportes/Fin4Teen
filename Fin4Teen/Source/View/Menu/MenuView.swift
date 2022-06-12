//
//  MenuView.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

class MenuView: UIView, ViewCodeContract {
    
    // MARK: - Properties
    
    var didTapAbout: (() -> Void)?
    var didTapHelp: (() -> Void)?
    var didTapLogout: (() -> Void)?
    var didTapClose: (() -> Void)?
    
    let versionApp = AppControlVersion().checkVersionLimit()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.setColor(color: .grayLight)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Viewcode
    
    private lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.setColor(color: .whiteStandart)
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var avatarImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: Image.avatar.rawValue)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.teenSemiBoldFontButton.withSize(16)
        label.textColor = UIColor.setColor(color: .blueDarkColor)
        label.text = "Username@"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var aboutSectionView: FTNCellView = {
        let view = FTNCellView()
        view.setup(title: "Sobre",
                   icon: UIImage(named: Image.angleRight.rawValue),
                   colorHorizontalLine: UIColor.setColor(color: .grayDarkest),
                   action: { [weak self] in
                    self?.didTapAbout?()
                   })
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var helpSectionView: FTNCellView = {
        let view = FTNCellView()
        view.setup(title: "Ajuda",
                   icon: UIImage(named: Image.angleRight.rawValue),
                   colorHorizontalLine: UIColor.setColor(color: .grayDarkest),
                   action: { [weak self] in
                    self?.didTapHelp?()
                   })
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var faqSectionView: FTNCellView = {
        let view = FTNCellView()
        view.setup(title: "FAQ",
                   icon: UIImage(named: Image.angleRight.rawValue),
                   colorHorizontalLine: UIColor.setColor(color: .grayDarkest),
                   action: { [weak self] in
                    self?.didTapHelp?()
                   })
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var versionAppSectionView: FTNCellView = {
        let view = FTNCellView()
        view.setup(title: "Versão do aplicativo (\(versionApp))",
                   colorHorizontalLine: UIColor.setColor(color: .grayDarkest),
                   action: { [weak self] in
                    /*empty method*/
                   })
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var logoutButton: FTNViewAction = {
        let button = FTNViewAction()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
    
    // MARK: - Setup viewcode
    
    func setupHierarchy() {
        self.addSubview(headerView)
        self.addSubview(aboutSectionView)
        self.addSubview(helpSectionView)
        self.addSubview(logoutButton)
        self.addSubview(closeButton)
        self.addSubview(faqSectionView)
        self.addSubview(versionAppSectionView)
        headerView.addSubview(avatarImage)
        headerView.addSubview(usernameLabel)
    }
    
    func setupConstraints() {
        headerView
            .topAnchor(in: self, padding: 90)
            .leftAnchor(in: self, padding: 30)
            .rightAnchor(in: self, padding: 30)
            .heightAnchor(107)
        
        closeButton
            .topAnchor(in: self, padding: 40)
            .rightAnchor(in: self, padding: 30)
            .heightAnchor(15)
            .widthAnchor(15)
        
        avatarImage
            .centerY(in: headerView)
            .leftAnchor(in: headerView, padding: 30)
            .heightAnchor(45)
            .widthAnchor(45)
        
        usernameLabel
            .centerY(in: headerView)
            .leftAnchor(in: avatarImage, attribute: .right, padding: 10)
        
        aboutSectionView
            .topAnchor(in: headerView, attribute: .bottom, padding: 50)
            .leftAnchor(in: self, padding: 30)
            .rightAnchor(in: self, padding: 30)
            .heightAnchor(75)
        
        helpSectionView
            .topAnchor(in: aboutSectionView, attribute: .bottom)
            .leftAnchor(in: self, padding: 30)
            .rightAnchor(in: self, padding: 30)
            .heightAnchor(75)
        
        faqSectionView
            .topAnchor(in: helpSectionView, attribute: .bottom)
            .leftAnchor(in: self, padding: 30)
            .rightAnchor(in: self, padding: 30)
            .heightAnchor(75)
        
        versionAppSectionView
            .topAnchor(in: faqSectionView, attribute: .bottom)
            .leftAnchor(in: self, padding: 30)
            .rightAnchor(in: self, padding: 30)
            .heightAnchor(75)
        
        logoutButton
            .leftAnchor(in: self, padding: 30)
            .widthAnchor(100)
            .heightAnchor(30)
            .bottomAnchor(in: self, padding: 50)

    }
    
    func setupConfiguration() {
        headerView.roundCorners(cornerRadius: 15.0,
                                typeCorners: [.topLeft,
                                              .topRight,
                                              .bottomLeft,
                                              .bottomRight])
        
        logoutButton.setup(title: "Sair da conta",
                           image: UIImage(named: Image.logout.rawValue),
                           backgroundColor: UIColor.clear,
                           action: { [weak self] in
                            self?.didTapLogout?()
                           })
        
        aboutSectionView.notifyCount(isHidden: true)
        helpSectionView.notifyCount(isHidden: true)
        faqSectionView.notifyCount(isHidden: true)
        versionAppSectionView.notifyCount(isHidden: true)
        
    }
    
    // MARK: - Setup actions

    func setup(aboutAction: @escaping Action,
               helpAction: @escaping Action,
               logoutAction: @escaping Action,
               closeAction: @escaping Action) {
        self.didTapAbout = aboutAction
        self.didTapHelp = helpAction
        self.didTapLogout = logoutAction
        self.didTapClose = closeAction
    }
    
}
