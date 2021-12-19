
import UIKit

protocol NomadCustomTextFieldStackViewDelegate: AnyObject {
    func updateTextField(text: String)
}


final class NomadCustomTextFieldStackView: UIStackView {
    
    //MARK: - Properties
    
    weak var delegate: NomadCustomTextFieldStackViewDelegate?
    
    private let titleStacktext: String //propriedades
    private let placeholderText: String
    private let buttomTitle: String
    
    private let shouldDisplayButtom: Bool
    private let isSecure: Bool
    
    //MARK: - UI Components
    
    private lazy var passwordTitlleLabel: UILabel = { //componentes
        let label = UILabel()
        label.text = titleStacktext
        label.textColor = .black
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var passwordTextFild: UITextField = {
        let tf = UITextField()
        tf.placeholder = placeholderText
        tf.isSecureTextEntry = isSecure
        tf.delegate = self
        return tf
        
    }()
    
    private lazy var passwordTextFieldHStack:UIStackView = {
//        let stack = UIStackView(arrangedSubviews: [passwordTextFild, forgoPasswordButton])
        let stack = UIStackView()
        stack.axis = .horizontal
        return stack
    }()
    
    private lazy var passwordBottomDividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var forgoPasswordButton: UIButton = {
        let button = UIButton (type: .system)
        button.setTitle(buttomTitle, for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    //MARK: - Constructor
    
    init(titleStacktext: String, placeholderText: String, //inicializador
         buttomTitle: String = "", shouldDisplayButtom: Bool = false , isSecure: Bool = false) {
        self.titleStacktext = titleStacktext
        self.placeholderText = placeholderText
        self.buttomTitle = buttomTitle
        self.shouldDisplayButtom = shouldDisplayButtom
        self.isSecure = isSecure
        super.init(frame: .zero)
        
        commomInit()
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implement")
    }
    
//  func commomInit(){ // ajudas
//        conViewHerarchy()
//        configureConstraints()
//        configureStyle()
    
    
    func getTfText() -> String {
        return passwordTextFild.text ?? " "
    }
    
    
} // final do codigo




//MARK: - CustomBaseViewLayout

extension NomadCustomTextFieldStackView: CustomBaseViewLayout{
    func configureViewHierarchy() {
        passwordTextFieldHStack.addArrangedSubview(passwordTextFild)
        if shouldDisplayButtom{
            passwordTextFieldHStack.addArrangedSubview(forgoPasswordButton)
        }
        
        
        addArrangedSubview(passwordTitlleLabel)
        addArrangedSubview(passwordTextFieldHStack)
        addArrangedSubview(passwordBottomDividerView)

    }
    
    func configureConstraint() {
        passwordTextFild.snp.makeConstraints {$0.height.equalTo(50)}
        passwordBottomDividerView.snp.makeConstraints {$0.height.equalTo(1)}
        forgoPasswordButton.snp.makeConstraints {$0.width.equalTo(100)}
   }
     
    func configureStyle(){
         spacing = 5
         axis = .vertical
     }
}
extension NomadCustomTextFieldStackView: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        delegate?.updateTextField(text: textField.text ?? " ")
    }
}
    


