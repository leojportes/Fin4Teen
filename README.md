![Badge](https://img.shields.io/badge/Swift-FA7343?style=for-the-badge&logo=swift&logoColor=white) ![Badge](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=Apple&logoColor=white)

* [Fin4teen Web](https://leojportes.github.io/Fin4teenWeb/)

# Fin4teen

<b>Aplicativo de Educação Financeira com foco em jovens.<br>

## Tópicos 

 [Descrição do projeto](#descrição-do-projeto)
 
 [Construção](#construção)
 
 [Possíveis Melhorias](#possíveis-melhorias)
 
 [Build](#build)
 
 [Dependências](#dependencias)
 
 ## Conteúdo: 
 
- **[Componentes disponíveis](#componentes-disponíveis)**<br>


## Descrição do Projeto
<b>No aplicativo, há sessões de videoaulas, recomendações, que recomenda livros, filmes, séries e programas de TV. <br>

* [Instagram Fin4teen](https://www.instagram.com/fin4teenapp/)
 

![AppFin4teen](https://github.com/leojportes/Fin4teen/blob/main/Corte.gif)

## Construção
Aplicação foi desenvolvida em [Swift](https://www.apple.com/br/swift/) por meio da IDE Xcode.

## Possíveis Melhorias
<b>Expansões</b>: Adicionar sessão de programas de TV e Séries no app.<br>
<b>Responsividade</b>: Adequar layout responsivel para visualização em diferentes dispositivos mobile Apple.<br>
<b>Testes</b>: Aplicação de testes unitários.

## Build
Necessário ter [Xcode](https://developer.apple.com/xcode/) instalado.

## Dependências
<b>Firebase/Auth<br>
 
Projeto gerado com Xcode version 12.5.
 
## Componentes disponíveis: 
- **[TeenButton](#teenbutton)**<br>
- **[TeenButtonIcon](#teenbuttonicon)**<br>
- **[TeenMenuButton](#teenmenubutton)**<br>
- **[TeenViewAction](#teenviewaction)**<br>
- **[TeenCellView](#teencellview)**<br>
 
 ## TeenButton
 
Init:
-`init(title: String,
         font: UIFont? = UIFont.teenRegularFont.withSize(16),
         backgroundColor: UIColor,
         textColor: UIColor,
         accessibilityTitle: String,
         action: Action?)`

**Exemplo de uso:**

``` swift 
 
 private lazy var loginButton: TeenButton = {
        let button = TeenButton(title: "Enviar",
                                font: UIFont.teenSemiBoldFontButton,
                                backgroundColor: UIColor.TeenColor.blackColor,
                                textColor: UIColor.TeenColor.whiteStandart,
                                accessibilityTitle: "Enviar",
                                action: { [weak self] in
                                    print("enviar tapped")
                                    self?.didTapSendRecovery?()
                                })
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

 ```
 
 ## TeenButtonIcon
 
 Init:
-`init(image: UIImage? = nil,
         backgroundColor: UIColor,
         colorButton: UIColor? = nil,
         accessibility: String,
         action: Action?)`

**Exemplo de uso:**

``` swift 

 private lazy var backButton: TeenButtonIcon = {
        let button = TeenButtonIcon(image: UIImage(named: Image.angleLeft.rawValue),
                                    backgroundColor: UIColor.clear,
                                    colorButton: UIColor.TeenColor.grayLight,
                                    accessibility: "Voltar",
                                    action: { [weak self] in
                                        print("back button tapped")
                                        self?.didTapBack?()
                                    })
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

 ```
 
 ## TeenViewAction

 Métodos públicos:
 -`public func setup(title: String, image: UIImage? = nil, backgroundColor: UIColor, action: @escaping Action)`
 
 **Exemplo de uso:**
 
 ``` swift 
 
   private lazy var recoveryPassLabel: TeenViewAction = {
        let button = TeenViewAction()
        button.setup(title: "Esqueceu a senha?",
                     backgroundColor: .clear,
                     action: { [weak self] in
                        self?.didTapRecoveryPass?()
                     })
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

 ```
 
 ## TeenCellView
 
 Métodos públicos:
 -`public func setup(title: String,
                      font: UIFont? = UIFont.teenRegularFont.withSize(16),
                      colorFont: UIColor? = nil,
                      icon: UIImage? = nil,
                      colorHorizontalLine: UIColor? = UIColor.TeenColor.grayLight,
                      notifyCount: String? = "",
                      notifyIsHidden: Bool,
                      action: Action?)`
 
 **Exemplo de uso:**
 
 ``` swift 
 
      private lazy var headerView: TeenCellView = {
        let view = TeenCellView()
        view.setup(title: "Fin4teen",
                   font:  UIFont.teenSemiBoldFontButton.withSize(24),
                   colorFont: UIColor.systemGreen,
                   icon: UIImage(named: Image.menuSanduiche.rawValue),
                   notifyIsHidden: true,
                   action: { [weak self] in
                    self?.didTapMenu?()
                   })
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

 ```
    
