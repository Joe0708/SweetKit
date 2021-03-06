import UIKit

public extension UITextField {
    
    /// UITextField text type.
    ///
    /// - emailAddress: UITextField is used to enter email addresses.
    /// - password: UITextField is used to enter passwords.
    /// - generic: UITextField is used to enter generic text.
    public enum TextType {
        case emailAddress
        case password
        case generic
    }
    
    /// Set textField for common text types.
    public var textType: TextType {
        get {
            if keyboardType == .emailAddress {
                return .emailAddress
            } else if isSecureTextEntry {
                return .password
            }
            return .generic
        }
        set {
            switch newValue {
            case .emailAddress:
                keyboardType = .emailAddress
                autocorrectionType = .no
                autocapitalizationType = .none
                isSecureTextEntry = false
                
            case .password:
                keyboardType = .asciiCapable
                autocorrectionType = .no
                autocapitalizationType = .none
                isSecureTextEntry = true
                
            case .generic:
                isSecureTextEntry = false
                
            }
        }
    }
    
    public var fontSize: CGFloat {
        get {
            return self.font?.pointSize ?? 17
        }
        set {
            self.font = UIFont.systemFont(ofSize: newValue)
        }
    }
    
    /// EZSE: Add left padding to the text in textfield
    public func addLeftTextPadding(_ blankSize: CGFloat) {
        let leftView = UIView()
        leftView.frame = CGRect(x: 0, y: 0, width: blankSize, height: frame.height)
        self.leftView = leftView
        self.leftViewMode = UITextFieldViewMode.always
    }
    
    /// EZSE: Add a image icon on the left side of the textfield
    public func addLeftIcon(_ image: UIImage?, frame: CGRect, imageSize: CGSize) {
        let leftView = UIView(frame: frame)
        let imgView = UIImageView()
        imgView.frame = CGRect(x: frame.width - 8 - imageSize.width, y: (frame.height - imageSize.height) / 2, width: imageSize.width, height: imageSize.height)
        imgView.image = image
        leftView.addSubview(imgView)
        self.leftView = leftView
        self.leftViewMode = UITextFieldViewMode.always
    }
}
