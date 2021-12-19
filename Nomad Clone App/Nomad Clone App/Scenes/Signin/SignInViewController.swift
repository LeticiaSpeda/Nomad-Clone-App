import SnapKit

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
        titleStacktext: "Insira sua senha de 8 caracteres",
        placeholderText: "Sua senha",
        buttomTitle: "Esqueceu?",
        shouldDisplayButtom: true, //aparecer botao
        isSecure: true
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
        view.backgroundColor = .white
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
        
        nomadLogo.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)  //$0 representa o objeto
            $0.centerX.equalTo(view.snp.centerX)
            $0.width.equalTo(120)
            $0.height.equalTo(50)
        }
        
        maisStackview.snp.makeConstraints {
            $0.centerY.equalTo(view.snp.centerY)
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.trailing.equalTo(view.snp.trailing).offset(-20)
        }
        createAccountLabel.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-15)
            $0.centerX.equalTo(view.snp.centerX)
        }
        accessAccountButton.snp.makeConstraints {
            $0.bottom.equalTo(createAccountLabel.snp.top).offset(-20)
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.trailing.equalTo(view.snp.trailing).offset(-20)
            $0.height.equalTo(50)
        }
        
       func configureStyle() { //configurando estilo da tela
            self.view.backgroundColor = .white
        }
        
    }
        

}
