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
    
    private func configureViewHierarchy(){ //quais telas vao ser adicionadas
        view.addSubview(nomadLogo) //objeto dentro daq view
    }
    
    private func configureConstrints(){ //configurando as constraints (deixar na posicao)
        nomadLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        nomadLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nomadLogo.widthAnchor.constraint(equalToConstant: 120).isActive = true
        nomadLogo.heightAnchor.constraint(lessThanOrEqualToConstant: 50).isActive = true
    }
    
    
    private func configureStyle() { //configurando estilo da tela
        self.view.backgroundColor = .white
        
    }
    
} // final codigo
