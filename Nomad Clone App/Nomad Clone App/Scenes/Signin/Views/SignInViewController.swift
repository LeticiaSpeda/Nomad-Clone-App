import SnapKit

final class SignInSViewController: NomadaCustomViewController {
    
    //MARK: - Properties
    
    var viewModel: SignInViewModel
    
    
    //MARK: - UI Components
    
    private lazy var nomadLogo: UIImageView = { //so carrega qndo for chamado
        let image = UIImage (named: "NomadLogoBlack") //objeto
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
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
        button.backgroundColor = .disableButton
        button.layer.cornerRadius = 8
        button.isEnabled = false
        button.addTarget(self, action: #selector(AccessAccountHandeAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var createAccountLabel: UILabel = {
        let label = UILabel ()
        label.text = "Abrir minha conta"
        label.textColor = .black
        label.attributedText = label.text?.underLine
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(createAccountHandleAction))
        label.addGestureRecognizer(tap)
        label.isUserInteractionEnabled = true
        return label
    }()
    
    private lazy var maisStackview: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [CPFStackView, passwordStackView])
        stack.spacing = 30
        stack.axis = .vertical
        return stack
    }()
    
    //MARK - Constructor
    
    init(viewModel: SignInViewModelProtocol = SignInViewModel()) { //injecao dependencia
        self.viewModel = viewModel as! SignInViewModel
        super.init(nibName: nil , bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad() //tela carrega
        commomInit() //chama essa funcao
        configureDelegates()
        
        view.backgroundColor = .white
    }
    
    //MARK: - Helpers
    
     func configureViewHierarchy(){ //quais telas vao ser adicionadas no caso o logo
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
    
        
    }
    
    func configureStyle() { //configurando estilo da tela
        self.view.backgroundColor = .white
    }
    
    func validateButtonState(){
//        let buttonInformation = viewModel.changeButtonState(
//            tf1: CPFStackView.getTfText(),
//            tf2: passwordStackView.getTfText())
//        accessAccountButton.backgroundColor = buttonInformation.color
//        accessAccountButton.isEnabled = buttonInformation.isEnable
        let (state, color) = viewModel.changeButtonState(tf1: CPFStackView.getTfText(), tf2: passwordStackView.getTfText())
        accessAccountButton.isEnabled = state
        accessAccountButton.backgroundColor = color
    }
    
    private func configureDelegates() {
        CPFStackView.delegate = self
        passwordStackView.delegate = self
    }
    

    
    //MARK - Selector
    
    @objc private func AccessAccountHandeAction() {
        print ("botao clicado")
    }
    
    @objc private func createAccountHandleAction() {
        print ("label clicada")
    }
    
}

// MARK - NomadCustomTextFieldStackViewDelegate
extension SignInSViewController: NomadCustomTextFieldStackViewDelegate{
    func updateTextField(text: String) {
         validateButtonState()
    }
}
    
    

