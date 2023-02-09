
import Foundation
import UIKit

extension SignUpViewController {
    func makeAlert(title:String,msg:String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle:UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style:UIAlertAction.Style.default)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
}

extension VerificationViewController {
    func makeAlert(title:String,msg:String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle:UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style:UIAlertAction.Style.default)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
}
