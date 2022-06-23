//
//  ContentsHomeView.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

class ContentsHomeView: UIView, ViewCodeContract {
    
    // MARK: - Properties
    var didTapBack: Action?
    var didTapMenu: Action?
    var didTapInvestiments: Action?
    var didTapFinancialMarket: Action?
    var didTapAboutMoney: Action?
    var didTapCripto: Action?
    var didTapstockExchange: Action?
    var didTapCuriosities: Action?
    
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
    
    private lazy var navigationBarView: FTNNavigationBarView = {
        let view = FTNNavigationBarView(backgroundColor: UIColor.white,
                                         colorButton: UIColor.setColor(.blackColor),
                                         colorHorizontalLine: UIColor.setColor(.grayMedium),
                                         iconRight: UIImage(named: Image.angleLeft.rawValue),
                                         backButtonAction: { [weak self] in
                                            self?.didTapBack?()
                                         })
        view.set(title: "Conteúdos",
                 color: UIColor.setColor(.blackColor),
                 font: UIFont.teenRegularFont.withSize(16))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
  
    private lazy var investimentSectionView: FTNCellView = {
        let view = FTNCellView()
        view.setup(title: "Investimentos",
                   icon: UIImage(named: Image.angleRight.rawValue),
                   action: { [weak self] in
                    self?.didTapInvestiments?()
                   })
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var financialMarketSectionView: FTNCellView = {
        let view = FTNCellView()
        view.setup(title: "Mercado Financeiro",
                   icon: UIImage(named: Image.angleRight.rawValue),
                   action: { [weak self] in
                    self?.didTapFinancialMarket?()
                   })
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var aboutMoneySectionView: FTNCellView = {
        let view = FTNCellView()
        view.setup(title: "Sobre o seu dinheiro",
                   icon: UIImage(named: Image.angleRight.rawValue),
                   action: { [weak self] in
                    self?.didTapAboutMoney?()
                   })
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var criptoCoinsSectionView: FTNCellView = {
        let view = FTNCellView()
        view.setup(title: "Criptomoedas",
                   icon: UIImage(named: Image.angleRight.rawValue),
                   action: { [weak self] in
                    self?.didTapCripto?()
                   })
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stockExchangeSectionView: FTNCellView = {
        let view = FTNCellView()
        view.setup(title: "Bolsa de valores",
                   icon: UIImage(named: Image.angleRight.rawValue),
                   action: { [weak self] in
                    self?.didTapstockExchange?()
                   })
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var curiositiesSectionView: FTNCellView = {
        let view = FTNCellView()
        view.setup(title: "Curiosidades",
                   icon: UIImage(named: Image.angleRight.rawValue),
                   action: { [weak self] in
                    self?.didTapCuriosities?()
                   })
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Setup viewcode
    
    func setupHierarchy() {
        self.addSubview(navigationBarView)
        self.addSubview(investimentSectionView)
        self.addSubview(financialMarketSectionView)
        self.addSubview(aboutMoneySectionView)
        self.addSubview(criptoCoinsSectionView)
        self.addSubview(stockExchangeSectionView)
        self.addSubview(curiositiesSectionView)
    }
    
    func setupConstraints() {
        
        navigationBarView
            .topAnchor(in: self)
            .leftAnchor(in: self)
            .rightAnchor(in: self)
            .heightAnchor(70)

        investimentSectionView
            .topAnchor(in: navigationBarView, attribute: .bottom, padding: 40)
            .leftAnchor(in: self, padding: 30)
            .rightAnchor(in: self, padding: 30)
            .heightAnchor(75)
        
        financialMarketSectionView
            .topAnchor(in: investimentSectionView, attribute: .bottom, padding: 0)
            .leftAnchor(in: self, padding: 30)
            .rightAnchor(in: self, padding: 30)
            .heightAnchor(75)
        
        aboutMoneySectionView
            .topAnchor(in: financialMarketSectionView, attribute: .bottom, padding: 0)
            .leftAnchor(in: self, padding: 30)
            .rightAnchor(in: self, padding: 30)
            .heightAnchor(75)
        
        criptoCoinsSectionView
            .topAnchor(in: aboutMoneySectionView, attribute: .bottom, padding: 0)
            .leftAnchor(in: self, padding: 30)
            .rightAnchor(in: self, padding: 30)
            .heightAnchor(75)
        
        stockExchangeSectionView
            .topAnchor(in: criptoCoinsSectionView, attribute: .bottom, padding: 0)
            .leftAnchor(in: self, padding: 30)
            .rightAnchor(in: self, padding: 30)
            .heightAnchor(75)
        
        curiositiesSectionView
            .topAnchor(in: stockExchangeSectionView, attribute: .bottom, padding: 0)
            .leftAnchor(in: self, padding: 30)
            .rightAnchor(in: self, padding: 30)
            .heightAnchor(75)
    }
    
    func setupConfiguration() {
        /* empty method */
    }
    
    func setup(menuAction: @escaping Action,
               backAction: @escaping Action,
               investimentAction: @escaping Action,
               financialMarketAction: @escaping Action,
               aboutMoneyAction: @escaping Action,
               criptoAction: @escaping Action,
               stockExchangeAction: @escaping Action,
               curiositiesAction: @escaping Action) {
        self.didTapMenu = menuAction
        self.didTapInvestiments = investimentAction
        self.didTapFinancialMarket = financialMarketAction
        self.didTapAboutMoney = aboutMoneyAction
        self.didTapCripto = criptoAction
        self.didTapstockExchange = stockExchangeAction
        self.didTapCuriosities = curiositiesAction
        self.didTapBack = backAction
    }
    
    func setNumbersOfContents(invest: String,
                              financialMarket: String,
                              aboutmoney: String,
                              criptoCoins: String,
                              stockExchange: String,
                              curiosities: String) {
        investimentSectionView.notifyCount(notifyCount: invest)
        financialMarketSectionView.notifyCount(notifyCount: financialMarket)
        aboutMoneySectionView.notifyCount(notifyCount: aboutmoney)
        criptoCoinsSectionView.notifyCount(notifyCount: criptoCoins)
        stockExchangeSectionView.notifyCount(notifyCount: stockExchange)
        curiositiesSectionView.notifyCount(notifyCount: curiosities)

    }
    
}
