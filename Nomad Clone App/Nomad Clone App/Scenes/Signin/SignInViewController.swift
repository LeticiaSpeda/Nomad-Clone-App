import SnapKit

final class SignInViewController: NomadaCustomViewController {
    
    
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
        return button
    }()
    
    private lazy var createAccountLabel: UILabel = {
        let label = UILabel ()
        label.text = "Abrir minha conta"
        label.textColor = .black
        label.attributedText = label.text?.underLine
        return label
    }()
    
    private lazy var maisStackview: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [CPFStackView, passwordStackView])
        stack.spacing = 30
        stack.axis = .vertical
        return stack
    }()
    
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
    
        private func configureDelegates() {
            CPFStackView.delegate = self
            passwordStackView.delegate = self
               }
    
    private func  buttonIsEnable() -> Bool {
        let CPFconditions: Bool = (!CPFStackView.getTfText().isEmpty)
        
        let passwordConditions: Bool = (!passwordStackView.getTfText().isEmpty)
        
        return CPFconditions && passwordConditions
    }
    private func changeButtonState(_ isEnable: Bool){
        accessAccountButton.isEnabled = isEnable
        accessAccountButton.backgroundColor = isEnable ? .nomadYellowColor : .disableButton  //verificacao ternaria
    }
}
extension SignInViewController: NomadCustomTextFieldStackViewDelegate{
    func updateTextField(text: String) {
        changeButtonState(buttonIsEnable())
        }
    }
    
    

