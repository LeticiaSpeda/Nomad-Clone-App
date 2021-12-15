import UIKit

typealias NomadaCustomViewController = ( UIViewController & CustomBaseViewLayout ) //apelido para chamar as telas
typealias NomadCustomView = (UIView & CustomBaseViewLayout)

protocol CustomBaseViewLayout {
    func configureViewHierarchy()
    func configureConstraint()
    func configureStyle()
}
extension CustomBaseViewLayout{
    func commomInit(){
         configureViewHierarchy()
         configureConstraint()
         configureStyle()
    }
    
    func configureStyle(){}
    
} // final do codigo
