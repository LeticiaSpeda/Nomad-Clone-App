import UIKit

extension UIColor {
    ///Cor padrao para os componentes do app habilitados
    static var nomadYellowColor: UIColor {
        return UIColor(red: .setColor(251), green: .setColor(212), blue: .setColor(5), alpha: 1)
    }

    /// Cor padrao para os componentes do app desabilitado
    static var disableButton: UIColor{
        return UIColor.systemGray.withAlphaComponent(0.4)
    }
    
  
}
