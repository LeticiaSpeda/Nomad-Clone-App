import UIKit


extension String {
    var underLine: NSAttributedString{
        NSAttributedString(string: self, attributes: [.underlineStyle:
            NSUnderlineStyle.single.rawValue])
    }
}
