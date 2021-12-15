import UIKit

final class SignInViewController: NomadaCustomViewController {
    
    
    //MARK: - UI Components
    
    private lazy var nomadLogo: UIImageView = { //so carrega qndo for chamado
        let image = UIImage (named: "NomadLogoBlack") //objeto
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var CPFStackView = NomadCustomTextFieldStackView(
        titleStacktext: "Insira seu CPF ",
        placeholderText: "Seu CPF"
    )
    
    
    private lazy var passwordStackView = NomadCustomTextFieldStackView(
        titleStacktext: "Insira sua senha",
        placeholderText: "Sua senha",
        buttomTitle: "Esqueceu?",
        shouldDisplayButtom: true //aparecer botao
    )
    
    private lazy var accessAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Acessar minha conta", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor.systemGray.withAlphaComponent(0.4)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var createAccountLabel: UILabel = {
        let label = UILabel ()
        label.text = "Abrir minha conta"
        label.textColor = .black
        label.attributedText = NSAttributedString(string: label.text ?? "", attributes:
        [.underlineStyle: NSUnderlineStyle.single.rawValue])
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var maisStackview: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [CPFStackView, passwordStackView])
        stack.spacing = 30
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad() //tela carrega
        commomInit() //chama essa funcao
    }
    
    //MARK: - Helpers
    
     func configureViewHierarchy(){ //quais telas vao ser adicionadas no caso o logo
//        view.addSubview(nomadLogo) //objeto dentro daq view
//        
//       view.addSubview(maisStackview)
//        
//        view.addSubview(accessAccountButton)
//        view.addSubview(createAccountLabel)
        
        [nomadLogo, maisStackview, accessAccountButton, createAccountLabel].forEach { view in
            self.view.addSubview(view)
        }
        
    }
    
    func configureConstraint() {
        nomadLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        nomadLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nomadLogo.widthAnchor.constraint(equalToConstant: 120).isActive = true
        nomadLogo.heightAnchor.constraint(lessThanOrEqualToConstant: 50).isActive = true

            
           
        maisStackview.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        maisStackview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        maisStackview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
            
        createAccountLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15).isActive = true
        createAccountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        accessAccountButton.bottomAnchor.constraint(equalTo: createAccountLabel.topAnchor, constant: -20).isActive = true
        accessAccountButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        accessAccountButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        accessAccountButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        
        
       func configureStyle() { //configurando estilo da tela
            self.view.backgroundColor = .white
        }
    } // final codigo
    
    
    
        

