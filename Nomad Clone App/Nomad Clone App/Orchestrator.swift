//
//  Orchestrator.swift
//  Nomad Clone App
//
//  Created by Paolo Prodossimo Lopes on 10/12/21.
//  Copyright © 2021 Leticia de Oliveira Speda. All rights reserved.
//

import UIKit

final class Orchestrator: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        OperationQueue.main.addOperation { [weak self] in // referencia de memoria
            self?.gotoSignIn() //pegar o gotosigin da orchestrator
        }
        
    
    }
    
    private func gotoSignIn() {  //apresentar tela modelo modal
        let viewController = SignInViewController()
        viewController.modalPresentationStyle = .fullScreen //cobrir a tela vermelha inteira 
        present(viewController, animated: true, completion: nil)
    }
    
    //final codigo
}
