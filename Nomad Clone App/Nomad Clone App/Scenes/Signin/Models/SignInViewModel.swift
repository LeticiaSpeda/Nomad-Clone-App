//
//  SignInViewModel.swift
//  Nomad Clone App
//
//  Created by Paolo Prodossimo Lopes on 19/12/21.
//  Copyright © 2021 Leticia de Oliveira Speda. All rights reserved.
//

import Foundation
import UIKit

protocol SignInViewModelProtocol{
    func changeButtonState(tf1: String, tf2: String) -> (isEnable: Bool, color: UIColor) 
}


final class SignInViewModel: SignInViewModelProtocol{
    private func  buttonIsEnable(tf1: String, tf2: String) -> Bool {
        let CPFconditions: Bool = (!tf1.isEmpty)
        let passwordConditions: Bool = (!tf2.isEmpty)
        return CPFconditions && passwordConditions
    }
    
 func changeButtonState(tf1: String, tf2: String) -> (isEnable: Bool, color: UIColor) {
        let isEnable: Bool = buttonIsEnable(tf1: tf1, tf2: tf2)
    let color: UIColor = isEnable ? .nomadYellowColor : .disableButton
    return (isEnable, color)
    }
}
