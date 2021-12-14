//
//  SignInViewController.swift
//  Nomad Clone App
//
//  Created by Paolo Prodossimo Lopes on 10/12/21.
//  Copyright © 2021 Leticia de Oliveira Speda. All rights reserved.
//

import UIKit

final class SignInViewController: UIViewController {
    
    //MARK: - UI Components
    
    private lazy var nomadLogo: UIImageView = { //so carrega qndo for chamado
        let image = UIImage (named: "NomadLogoBlack") //objeto
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private lazy var CPFTitlleLabel: UILabel = {
        let label = UILabel()
        label.text = "Insira seu CPF"
        label.textColor = .black
        label.font = .systemFont(ofSize: 14)
        return label
    } ()
    
    private lazy var CPFtextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Seu CPF"  // ajuda da tela para a pessoa digitar
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private lazy var CPFBottomDividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var CPFStackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 5
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var passwordTitlleLabel: UILabel = {
        let label = UILabel()
        label.text = "Insira sua senha de 8 caracteres"
        label.textColor = .black
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var passwordTextFild: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Sua Senha"
        tf.isSecureTextEntry = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
        
    }()
    
    private lazy var passwordTextFieldHStack:UIStackView = {
        let stack = UIStackView(arrangedSubviews: [passwordTextFild, forgoPasswordButton])
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
        button.setTitle("Esqueceu?", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private lazy var passwordStackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 5
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
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
    
    private func commomInit(){ // chamando na tela as telas
        configureViewHierarchy()
        configureConstrints()
        configureStyle()
    }
    
    private func configureViewHierarchy(){ //quais telas vao ser adicionadas no caso o logo
        view.addSubview(nomadLogo) //objeto dentro daq view
        
        CPFStackView.addArrangedSubview(CPFTitlleLabel) // add label na stack
        CPFStackView.addArrangedSubview(CPFtextField) //add tf na stack
        CPFStackView.addArrangedSubview(CPFBottomDividerView) // add divisor na stack
       //view.addSubview(CPFStackView)  // add stack na tela
        
       passwordStackView.addArrangedSubview(passwordTitlleLabel)
       passwordStackView.addArrangedSubview(passwordTextFieldHStack)
        passwordStackView.addArrangedSubview(passwordBottomDividerView)
       //view.addSubview(passwordStackView)
       view.addSubview(maisStackview)
        
        view.addSubview(accessAccountButton)
        view.addSubview(createAccountLabel)
    }
    
    private func configureConstrints(){ //configurando as constraints (deixar na posicao)
        nomadLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        nomadLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nomadLogo.widthAnchor.constraint(equalToConstant: 120).isActive = true
        nomadLogo.heightAnchor.constraint(lessThanOrEqualToConstant: 50).isActive = true
        
        passwordTextFild.heightAnchor.constraint(equalToConstant: 50).isActive = true
        CPFBottomDividerView.heightAnchor.constraint(equalToConstant: 1).isActive =  true
        
        
        passwordTextFild.heightAnchor.constraint(equalToConstant: 50).isActive = true
        passwordBottomDividerView.heightAnchor.constraint(equalToConstant: 1).isActive =  true
        forgoPasswordButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
       
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
    
    
    private func configureStyle() { //configurando estilo da tela
        self.view.backgroundColor = .white
        
    }
    
} // final codigo
