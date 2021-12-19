
import UIKit

final class NomadCustomTextFieldStackView: UIStackView {
    
    private let titleStacktext: String //propriedades
    private let placeholderText: String
    private let buttomTitle: String
    
    private let shouldDisplayButtom: Bool
    private let isSecure: Bool
    
    
    
    private lazy var passwordTitlleLabel: UILabel = { //componentes
        let label = UILabel()
        label.text = titleStacktext
        label.textColor = .black
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var passwordTextFild: UITextField = {
        let tf = UITextField()
        tf.placeholder = placeholderText
        tf.isSecureTextEntry = isSecure
        tf.translatesAutoresizingMaskIntoConstraints = false
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
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var forgoPasswordButton: UIButton = {
        let button = UIButton (type: .system)
        button.setTitle(buttomTitle, for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
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
    
} // final do codigo

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
        passwordTextFild.heightAnchor.constraint(equalToConstant: 50).isActive = true
        passwordBottomDividerView.heightAnchor.constraint(equalToConstant: 1).isActive =  true
        forgoPasswordButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
     
    func configureStyle(){
         spacing = 5
         axis = .vertical
         translatesAutoresizingMaskIntoConstraints = false
     }
}
extension NomadCustomTextFieldStackView: UITableViewDelegate{
    
}
