

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var verificationBtnClick: UIButton!
    
    var userInformation:UserInformation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        verificationBtnClick.configurationUpdateHandler = { [unowned self] button in
          // 1
          var config = button.configuration

          config?.title = ""
          config?.image = UIImage(named: "VerificationG")?.withRenderingMode(.alwaysOriginal)
          button.isEnabled = true

          // 6
          button.configuration = config
        }
    }
  
    override func viewWillAppear(_ animated: Bool) {
        //buttonFeature(imageName: "VerificationG", button: verificationBtnClick,enable: false)
        
        DispatchQueue.main.async {
            if self.nameTextField.text != "" && self.surnameTextField.text != "" && self.phoneNumberTextField.text != "" || self.emailTextField.text != ""  {
                
                   

                self.phoneNumberTextField
                }
        }

    }
    
    @IBAction func VerificationBtnClick(_ sender: Any) {
        
        userInformation = UserInformation(name: nameTextField.text!, surName: surnameTextField.text!, email: emailTextField.text!, phoneNumber: phoneNumberTextField.text!)
        
        
        if nameTextField.text != "" && surnameTextField.text != "" && phoneNumberTextField.text != "" || emailTextField.text != ""  {
            DispatchQueue.main.async {
                self.verificationBtnClick.configurationUpdateHandler = { [unowned self] button in
                  // 1
                  var config = button.configuration

                  config?.title = ""
                  config?.image = UIImage(named: "Verification")?.withRenderingMode(.alwaysOriginal)
                  button.isEnabled = true

                  // 6
                  button.configuration = config
                }

               // buttonFeature(imageName: "Verification", button: self.verificationBtnClick,enable: true)
                
            }
            performSegue(withIdentifier: "VerificationVC", sender: userInformation)
            
        }else {
            makeAlert(title: "Error", msg: "Gerekli alanları doldurunuz...")
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "VerificationVC"{
            if let data = sender as? UserInformation {
                
                let destinationVC = segue.destination as! VerificationViewController 
                destinationVC.userInformation  = data
                
            }
        }
        
    }
    

}
