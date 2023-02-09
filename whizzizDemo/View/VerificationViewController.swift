

import UIKit

class VerificationViewController: UIViewController {
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var verificationTextField: UITextField!
    @IBOutlet weak var timeLabel: UILabel!
    
    //SegueVariable
    var userInformation:UserInformation?
   
    //API
    private var smsOtpSendAll:SmsOtpSendAll!
    var data:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // button kilidi eklenecek
        
        postData()
    }
    
    func postData(){
        
        if let userInformation = userInformation?.phoneNumber{
            infoLabel.text = "\(userInformation) numaralı telefona SMS yolu ile göndermiş olduğumuz 6 haneli kodu aşağıdaki alana girmelisin"
            var request = requestSmsOtpSend(phoneNumber: userInformation)
            
            
            PostSmsOtpService().smsOtpSend(request: request) { response in
                
                if let response = response{
                    self.smsOtpSendAll = SmsOtpSendAll(responseAll: response)
                    
                    self.data = self.smsOtpSendAll.takeResult().data
                    
                }
            }
        }

    }
    
    @IBAction func sendAgainBtnClick(_ sender: Any) {
    }
    
    @IBAction func verificationOtpBtnClick(_ sender: Any) {
   
        var requestCode = requestSmsOtpVerificationSend(id:self.data!, code:self.verificationTextField.text!)
        print("requestCode type: \(type(of: requestCode))")
        print("Gelen ID : \(self.data!)")
        
        PostSmsOtpVerificationService().smsOtpVerificationSend(request: requestCode) { response in
            
            if let response = response {
                print("View:\n \(response)\n \(response.result!)\(response.error?.message)")
                
                if self.verificationTextField.text!.count < 6 || ((self.verificationTextField.text?.isEmpty) == nil){
                    DispatchQueue.main.async {
                        self.makeAlert(title: "Error", msg: "ALANI DOGRU DOLDUR")
                    }
                }else {
                    
                    guard case let response.result! = true else{
                        DispatchQueue.main.async {
                            self.makeAlert(title: "Error", msg: response.error!.message)
                        }
                        return
                    }

                    DispatchQueue.main.async {
                            self.performSegue(withIdentifier: "passwordVC", sender: nil)
                        }
                }
                
                
                
                    
                    
                }
            }
        }
}
