
import Foundation
import UIKit

func buttonFeature(imageName:String,button:UIButton,enable:Bool) {
    
    
   

    
    button.isEnabled = enable
    button.setTitle("", for: .normal)
    let image = UIImage(named:imageName)
    DispatchQueue.main.async {
        button.setImage(image?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), for: .normal)
    }
}
