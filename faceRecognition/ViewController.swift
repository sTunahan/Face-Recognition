//
//  ViewController.swift
//  faceRecognition
//
//  Created by Tunahan on 6/22/22.
//

import UIKit
import LocalAuthentication // required library

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    
    @IBAction func signInClicked(_ sender: Any) {
        
        let autohContext = LAContext() // for verification
        
        var myError :NSError?
        // verify biometrically
        if autohContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &myError){
            
            autohContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "İnformation...") { success, Error in
                if success == true {
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toSecond", sender: nil)
                    }
                }else{
                    DispatchQueue.main.async {
                        self.myLabel.text = "Error!"

                    }
                }
            }
            
        }
    }
    
}

